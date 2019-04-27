#!/usr/bin/env ruby

require "clipboard"

def toplel(string)
  string = string.gsub(/\s+/, "")
  horizontal = string.split("").flat_map { |l| [l, " "] }[0...-1].join
  vertical = string.split("").flat_map { |x| [x, "\n"] }.drop(2).unshift("\n").join
  Clipboard.copy(horizontal + vertical)
end

puts toplel(ARGV.first)
