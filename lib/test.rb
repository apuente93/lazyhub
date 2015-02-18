require 'rubygems'
require 'nokogiri'
require 'open-uri'

reddit_page = Nokogiri::HTML(open("http://www.reddit.com/"))   
reddit_links = reddit_page.css("a.title.may-blank")
reddit_links.each{|link| puts "#{link.text}\t#{link['href']}"} 