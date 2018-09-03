# TODO: Remove removed videos and private videos
require 'httparty'

API_KEY = ENV["GOOGLE_YOUTUBE_API_KEY"].freeze

class YouTubePlaylistConverter
   Playlist = Struct.new(:name, :items) do
      def to_m3u
         [
           "#EXTM3U",
           items.map(&:to_m3u_entry)
         ].join("\n")
      end
   end

   PlaylistItem = Struct.new(:name, :url) do
      def to_m3u_entry
         "#EXTINF:0,#{name}\n#{url}"
      end
   end

   include HTTParty
   base_uri "https://www.googleapis.com/youtube"

   attr_reader :playlist_id

   def initialize(playlist_id:)
      @playlist_id = playlist_id
   end

   def call
      playlist = Playlist.new(playlist_name)
      items = playlist_items.map do |item|
         PlaylistItem.new(item.first, item.last)
      end
      playlist.items = items
      ["#{playlist.name}.m3u", playlist.to_m3u]
   end

   private

   def playlist_name
     response = self.class.get("/v3/playlists/", query: { part: "snippet", id: playlist_id, key: API_KEY})
     response["items"].first["snippet"]["title"]
   end

   def playlist_items
     response = self.class.get("/v3/playlistItems", query: { part: "snippet,contentDetails", playlistId: playlist_id, maxResults: 50, key: API_KEY})
     itemlist = response["items"]
     itemlist.map do |item|
        [
          item["snippet"]["title"],
          "https://www.youtube.com/watch?v=#{item['snippet']['resourceId']['videoId']}"
        ]
     end
   end
end

filename, playlist = YouTubePlaylistConverter.new(playlist_id: "PLktgS13HBqVzNdqWY-AW1FKMKl8kIZZBW").call
IO.write(filename, playlist)
