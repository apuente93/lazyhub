# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rubygems'
require 'nokogiri'
require 'open-uri'

reddit_page = Nokogiri::HTML(open("http://www.reddit.com/r/funny/"))   
reddit_links = reddit_page.css("a.title.may-blank")

admin = User.create!(username: "apuente",
                        email: "apuente@wisc.edu",
                        password: "racine93!",
                        password_confirmation: "racine93!",
                        admin: true)

reddit_links.each do |link| 
	Article.create!(content: "#{link['href']}",
						views: 0,
						article_type: "Laugh",
						article_type_id: 1,
						title: "#{link.text}",
						image_tag: "#{link['href']}",
						image_tag2: "#{link['href']}",
						rank: 0,
						views: 0,
						user_id:  1)
end