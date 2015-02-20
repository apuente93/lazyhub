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

reddit_page = Nokogiri::HTML(open("http://reddit.com/r/funny"))   
reddit_links = reddit_page.css("div.thing")

espn_page = Nokogiri::HTML(open("http://espn.go.com"))   
espn_links = espn_page.css("div#content.container div.span-2.ts-right.mod-skirmish div.mod-container.mod-tabs.mod-no-footer.top-headlines div.mod-content ul.headlines li a")

cnn_page = Nokogiri::HTML(open("http://cnn.com"))   
cnn_links = cnn_page.css("section#homepage1-zone-1 h3.cd__headline a")

gag_page = Nokogiri::HTML(open("http://9gag.com"))   
gag_links = gag_page.css("section#list-view-2 article.badge-entry-container header h2.badge-item-title a")

games_page = Nokogiri::HTML(open("http://www.addictinggames.com/hot-games/index.jsp"))   
games_links = games_page.css("div.gameSlot")

admin = User.create!(username: "apuente",
                        email: "apuente@wisc.edu",
                        password: "racine93!",
                        password_confirmation: "racine93!",
                        admin: true)

games_links.each do |link|
	a = link.css("p a")
	b = link.css("div.iconContainer a")
	Article.create!(content: "http://www.addictinggames.com#{b[0]['href']}",
						views: 0,
						article_type: "Game",
						article_type_id: 2,
						title: "#{a.text}",
						image_tag: "http://img2.wikia.nocookie.net/__cb20131228011010/logopedia/images/c/c2/Addicting_Games_974.jpg",
						image_tag2: "http://img2.wikia.nocookie.net/__cb20131228011010/logopedia/images/c/c2/Addicting_Games_974.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
end

gag_links.each do |link|
	a = "#{link['href']}"
	a.slice! "/gag/"
	Article.create!(content: "http://www.9gag.com#{link['href']}",
						views: 0,
						article_type: "Random",
						article_type_id: 4,
						title: "#{link.text}",
						image_tag: "http://img-9gag-ftw.9cache.com/photo/#{a}_460s.jpg",
						image_tag2: "http://img-9gag-ftw.9cache.com/photo/#{a}_460s.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
end

espn_links.each do |link| 
	Article.create!(content: "#{link['href']}",
						views: 0,
						article_type: "News",
						article_type_id: 3,
						title: "#{link.text}",
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/espn_logo_cuaiiw.jpg",
						image_tag2: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/espn_logo_2_m4orzz.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
end

#link.at_css("img")['src']

reddit_links.each do |link| 
	a = link.css("a.thumbnail")
	c = a.at_css("img")['src']
	b = link.css("a.title")
	Article.create!(content: "#{a[0]['href']}",
						views: 0,
						article_type: "Laugh",
						article_type_id: 1,
						title: "#{b.text}",
						image_tag: "http:#{c}",
						image_tag2: "http:#{c}",
						rank: 0,
						views: 0,
						user_id:  1)
end

cnn_links.each do |link| 
	Article.create!(content: "http://www.cnn.com#{link['href']}",
						views: 0,
						article_type: "News",
						article_type_id: 3,
						title: "#{link.text}",
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/cnn_logo_psiwce.jpg",
						image_tag2: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/cnn_logo_2_fzeoj1.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
end
