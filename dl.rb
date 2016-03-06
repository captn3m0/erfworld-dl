require 'json'
require 'open-uri'
require 'nokogiri'
require 'uri'

list = JSON.parse File.read 'list.json'
root = "http://archives.erfworld.com"

open('list.txt', "a") { |f|
	list.each do |url|
		url = URI.escape root + url
		doc = Nokogiri::HTML(open(url))
		image = doc.css('.page_content img').first['src']
		f.puts image
	end
}

