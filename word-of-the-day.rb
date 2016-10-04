#!/usr/bin/env ruby
require "nokogiri"
require "open-uri"
require "pry"

URL = "http://www.merriam-webster.com/word-of-the-day"

doc = Nokogiri::HTML(open(URL))

class String
  def drop_while(&block)
    self.chars.drop_while(&block).join("")
  end

  def drop(how_many)
    self.chars.drop(how_many).join("")
  end
end

word = doc.css(".word-and-pronunciation > h1").text
attributes = doc.css(".main-attr").text
possible_matches = doc.css(".wod-definition-container").children
headers = doc.css(".wod-definition-container").css("h2")
start_index = possible_matches.index(headers.first)
stop_index  = possible_matches.index(headers.last)

meanings = possible_matches.slice(start_index + 1, stop_index - start_index - 1).
  map { |meaning| meaning.text }.
  reject { |emptyline| emptyline.strip.empty? }.
  map { |meaning| meaning.drop_while { |c| c != ":" } }.
  map { |meaning| meaning.drop(2) }

puts "#{word};\"(#{attributes})\n#{meanings.map.with_index { |meaning, index| "#{index + 1}. #{meaning}" }.join("\n")}\""
