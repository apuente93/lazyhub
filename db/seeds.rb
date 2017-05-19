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

#Laugh
reddit_page = Nokogiri::HTML(open("https://www.reddit.com/r/funny"))   
reddit_links = reddit_page.css("div.thing")

ebaum_page = Nokogiri::HTML(open("http://www.ebaumsworld.com"))   
ebaum_links = ebaum_page.css("ul.homepageFeatures li.homepageFeature article")

#Sports
espn_page = Nokogiri::HTML(open("http://espn.go.com"))   
espn_links = espn_page.css("div section.col-three div.headlineStack section.headlineStack__listContainer ul.headlineStack__list li a")

goal_page = Nokogiri::HTML(open("http://www.goal.com/en-us/"))   
goal_links = goal_page.css("#homepage1-zone-1 div.l-container div div.column.zn__column--idx-2 ul")

#News
#bbc_page = Nokogiri::HTML(open("http://www.bbc.com/news"))   
#bbc_links = bbc_page.css("#comp-most-popular div div ul li a.most-popular-list-item__link")

cnn_page = Nokogiri::HTML(open("http://cnn.com"))   
cnn_links = cnn_page.css("article.cd--article div.cd__wrapper div.cd__headline")

#Random
gag_page = Nokogiri::HTML(open("https://9gag.com"))   
gag_links = gag_page.css("section#list-view-2 article.badge-entry-container header h2.badge-item-title a")

college_page = Nokogiri::HTML(open("http://www.collegehumor.com/"))   
college_links = college_page.css("div.primary div.pods-media div.pod-wrapper")
	
#Game
addicting_page = Nokogiri::HTML(open("http://www.addictinggames.com/hot-games/index.jsp"))   
addicting_links = addicting_page.css("div.gameSlot")

miniclip_page = Nokogiri::HTML(open("http://www.miniclip.com/games/genre-23/top-100/en/#t-n-H"))   
miniclip_links = miniclip_page.css("div#category-games-list a.game-icon")

#Tech
cnet_page = Nokogiri::HTML(open("https://www.cnet.com/news/"))   
cnet_links = cnet_page.css("div.fdListingContainer div.fdListing div.row a.assetHed")

pcmag_page = Nokogiri::HTML(open("http://www.pcmag.com/"))   
pcmag_links = pcmag_page.css("div#news-stack a")

#Social
#buzz_page = Nokogiri::HTML(open("https://www.buzzfeed.com"))   
#buzz_links = buzz_page.css("div.sidebar-content-js.card.xs-relative.xs-border-top-none.xs-mb2.xs-p2.clearfix")

ew_page = Nokogiri::HTML(open("http://www.ew.com/"))   
ew_links = ew_page.css("div #most-popular ol li.home-most-popular__list-item a.home-most-popular__item-link")

digg_page = Nokogiri::HTML(open("http://digg.com/"))   
digg_links = digg_page.css("div.grid-row div.grid-col-1 article.digg-story div.digg-story__content header.digg-story__header h2.digg-story__title a")

college_links[0..4].each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.collegehumor.com#{link['href']}",
						article_type: "Random",
						title: "#{link.text}".squish,
						image_tag: "http://www.technobuffalo.com/wp-content/uploads/2012/03/College-Humor-logo-640x359.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
		else
		end
	end
end

goal_links[0..4].each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.goal.com#{link['href']}",
						article_type: "Sports",
						title: "#{link.text}".squish,
						image_tag: "http://static.goal.com/280900/280936_heroa.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

pcmag_links[0..4].each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						article_type: "Tech",
						title: "#{link.text}".squish,
						image_tag: "http://www.getqardio.com/wp-content/uploads/2014/12/PCMag2.png",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

ebaum_links[0..4].each do |link|
	a = link.css("a")
	b = link.css("div.featureDescription")
	if Article.find_by_title("#{link.text}".strip_heredoc.lstrip.lines.first.squish).nil?
						Article.create!(content: "http://www.ebaumsworld.com#{a[0]['href']}",
						article_type: "Laugh",
						title: "#{link.text}".strip_heredoc.lstrip.lines.first.squish,
						image_tag: "http://cdn.ebaumsworld.com/mediaFiles/picture/366483/82271662.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

miniclip_links[0..4].each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.miniclip.com#{link['href']}",
						article_type: "Game",
						title: "#{link.text}".squish,
						image_tag: "http://www.lilireviews.com/wp-content/uploads/2013/08/Miniclip01-Logo1.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

digg_links[0..4].each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						article_type: "Social",
						title: "#{link.text}".squish,
						image_tag: "http://img2.wikia.nocookie.net/__cb20121224123923/logopedia/images/3/32/Digg_Logo.png",
						views: 0,
						isOld: false,
						user_id:  1)
		else
		end
	end
end

ew_links[0..4].each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						article_type: "Social",
						title: "#{link.text}".squish,
						image_tag: "http://www.majorcineplex.com/uploads/content/images/entertainment-weekly-logo.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
		else
		end
	end
end

#buzz_links[0..4].each do |link|
#	puts link
#	a = link.css("span.xs-col-12.xs-text-3.xs-block.xs-mb1.bold")
#	if "#{link.text}".squish.empty?
#	else
#		if Article.find_by_title("#{link.text}".squish).nil?
#						Article.create!(content: "https://www.buzzfeed.com#{link['href']}",
#						views: 0,
#						article_type: "Social",
#						title: "#{a.text}".squish,
#						image_tag: "http://s3-ak.buzzfed.com/static/images/global/buzzfeed.jpg?v=201502061701",
#						views: 0,
#						isOld: false,
#						user_id:  1)
#		else
#		end
#	end
#end

addicting_links[0..4].each do |link|
	a = link.css("p a")
	b = link.css("div.iconContainer a")
	if Article.find_by_title("#{a.text}".squish).nil?
						Article.create!(content: "http://www.addictinggames.com#{b[0]['href']}",
						article_type: "Game",
						title: "#{a.text}".squish,
						image_tag: "http://img2.wikia.nocookie.net/__cb20131228011010/logopedia/images/c/c2/Addicting_Games_974.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

cnet_links[0..4].each do |link|
	a = link.css("h3")
	if "#{a.text}".squish.empty?
	else
		if Article.find_by_title("#{a.text}".squish).nil?
						Article.create!(content: "https://www.cnet.com#{link['href']}",
						article_type: "Tech",
						title: "#{a.text}".squish,
						image_tag: "https://rimblogs.files.wordpress.com/2014/12/cnet-500x237.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
		else
		end
	end
end

gag_links[0..4].each do |link|
	a = "#{link['href']}"
	a.slice! "/gag/"
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "https://www.9gag.com#{link['href']}",
						article_type: "Random",
						title: "#{link.text}".squish,
						image_tag: "http://img-9gag-ftw.9cache.com/photo/#{a}_460s.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

espn_links[0..4].each do |link| 
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "https://www.espn.com#{link['href']}",
						article_type: "Sports",
						title: "#{link.text}".squish,
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/espn_logo_cuaiiw.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

reddit_links[1..5].each do |link| 
	a = link.css("a.thumbnail")
	c = a.at_css("img")['src']
	b = link.css("a.title")
	if Article.find_by_title("#{b.text}".squish).nil?
		if "#{a[0]['href']}".include? "/r/"
			Article.create!(content: "https://www.reddit.com#{a[0]['href']}",
						article_type: "Laugh",
						title: "#{b.text}".squish,
						image_tag: "http://famouslogos.net/images/reddit-logo.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
		else
			Article.create!(content: "#{a[0]['href']}",
						article_type: "Laugh",
						title: "#{b.text}".squish,
						image_tag: "http://famouslogos.net/images/reddit-logo.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
		end
	else
	end
end

cnn_links[0..4].each do |link| 
	puts link
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.cnn.com#{link['href']}",
						views: 0,
						article_type: "News",
						title: "#{a.text}".squish,
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/cnn_logo_psiwce.jpg",
						views: 0,
						isOld: false,
						user_id:  1)
	else
	end
end

#bbc_links[0..4].each do |link| 
#	if Article.find_by_title("#{link.text}".squish).nil?
#						Article.create!(content: "http://www.bbc.com/news#{link['href']}",
#						views: 0,
#						article_type: "News",
#						title: "#{link.text}".squish,
#						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1450291789/NY-Times-Logo_uny7hl.png ",
#						views: 0,
#						user_id:  1)
#	else
#	end
# end