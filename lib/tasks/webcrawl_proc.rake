# This file contains all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'rubygems'
require 'nokogiri'
require 'open-uri' 	 	

namespace :webcrawl_proc do
	task my_task: :environment do

#Laugh
reddit_page = Nokogiri::HTML(open("https://www.reddit.com/r/funny"))   
reddit_links = reddit_page.css("div.thing")

redditNews_page = Nokogiri::HTML(open("https://www.reddit.com/r/news"))
redditNews_links = redditNews_page.css("div.entry.unvoted a.title")

ebaum_page = Nokogiri::HTML(open("http://www.ebaumsworld.com"))   
ebaum_links = ebaum_page.css("ul.homepageFeatures li.homepageFeature article")

#Sports
espn_page = Nokogiri::HTML(open("http://espn.go.com"))   
espn_links = espn_page.css("div section.col-three div.headlineStack section.headlineStack__listContainer ul.headlineStack__list li a")

goal_page = Nokogiri::HTML(open("http://www.goal.com/en-us/"))   
goal_links = goal_page.css("#homepage1-zone-1 div.l-container div div.column.zn__column--idx-2 ul")

#News
bbc_page = Nokogiri::HTML(open("http://www.bbc.com/news"))   
bbc_links = bbc_page.css("div#news-top-stories-body-inline-international div.nw-c-top-stories--standard")

theGuardian_page = Nokogiri::HTML(open("https://www.theguardian.com/us"))
theGuardian_links = theGuardian_page.css("div.fc-slice-wrapper ul.fc-sublinks") 
#cnn_page = Nokogiri::HTML(open("http://cnn.com"))   
#cnn_links = cnn_page.css("section#homepage2-zone-1")

#Random
gag_page = Nokogiri::HTML(open("https://9gag.com/trending"))   
gag_links = gag_page.css("section#list-view-2 article.badge-entry-container header h2.badge-item-title a")

college_page = Nokogiri::HTML(open("http://www.collegehumor.com/"))   
college_links = college_page.css("div.primary div.pods-media div.pod-wrapper")

youtube_page = Nokogiri::HTML(open("https://www.youtube.com/feed/trending")) 
youtube_links = youtube_page.css("div.yt-lockup-dismissable")
	
#Game
addicting_page = Nokogiri::HTML(open("http://www.addictinggames.com/hot-games/index.jsp"))   
addicting_links = addicting_page.css("div.gameSlot")

miniclip_page = Nokogiri::HTML(open("https://www.miniclip.com/games/genre-23/top-100/en/#t-n-H"))   
miniclip_links = miniclip_page.css("div#category-games-list a.game-icon")

#Tech
cnet_page = Nokogiri::HTML(open("https://www.cnet.com/news/"))   
cnet_links = cnet_page.css("div.fdListingContainer div.fdListing div.row a.assetHed")

pcmag_page = Nokogiri::HTML(open("https://www.pcmag.com/"))   
pcmag_links = pcmag_page.css("div#news-stack a")

#Social
buzz_page = Nokogiri::HTML(open("https://www.buzzfeed.com"))   
buzz_links = buzz_page.css("div.sidebar-content-js.card.xs-relative.xs-border-top-none.xs-mb2.xs-p2.clearfix")

ew_page = Nokogiri::HTML(open("http://www.ew.com/"))   
ew_links = ew_page.css("div #most-popular ol li.home-most-popular__list-item a.home-most-popular__item-link")

digg_page = Nokogiri::HTML(open("http://digg.com/"))   
digg_links = digg_page.css("div.grid-row div.grid-col-1 article.digg-story div.digg-story__content header.digg-story__header h2.digg-story__title a")

college_links[0..4].each do |link|
	a = link.css("a")
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.collegehumor.com#{a[0]['href']}",
						article_type: "Random",
						title: "#{a.text}".squish,
						image_tag: "http://www.technobuffalo.com/wp-content/uploads/2012/03/College-Humor-logo-640x359.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
		end
	end
end

goal_links[0..4].each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.goal.com#{link['href']}",
						article_type: "Sports",
						title: "#{link.text}".squish,
						image_tag: "http://static.goal.com/280900/280936_heroa.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
	end
end

pcmag_links[0..4].each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						article_type: "Tech",
						title: "#{link.text}".squish,
						image_tag: "http://www.getqardio.com/wp-content/uploads/2014/12/PCMag2.png",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{link.text}".strip_heredoc.lstrip.lines.first.squish).update(isOld: 'false')
	end
end

miniclip_links[0..4].each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.miniclip.com#{link['href']}",
						article_type: "Game",
						title: "#{link.text}".squish,
						image_tag: "http://www.lilireviews.com/wp-content/uploads/2013/08/Miniclip01-Logo1.jpg",
						views: 1 + rand(1324),
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{a.text}".squish).update(isOld: 'false')
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.find_by_title("#{a.text}".squish).update(isOld: 'false')
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
	end
end

espn_links[0..4].each do |link| 
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "https://www.espn.com#{link['href']}",
						article_type: "Sports",
						title: "#{link.text}".squish,
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/espn_logo_cuaiiw.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
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
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.create!(content: "#{a[0]['href']}",
						article_type: "Laugh",
						title: "#{b.text}".squish,
						image_tag: "http://famouslogos.net/images/reddit-logo.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		end
	else
		Article.find_by_title("#{b.text}".squish).update(isOld: 'false')
	end
end

redditNews_links[0..1].each do |link| 
	if Article.find_by_title("#{link.text}".squish).nil?
		if "#{link['href']}".include? "/r/"
			Article.create!(content: "https://www.reddit.com#{link['href']}",
						article_type: "News",
						title: "#{link.text}".squish,
						image_tag: "http://famouslogos.net/images/reddit-logo.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.create!(content: "#{link['href']}",
						article_type: "News",
						title: "#{link.text}".squish,
						image_tag: "http://famouslogos.net/images/reddit-logo.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		end
	else
		Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
	end
end

#cnn_links[0..4].each do |link| 
#	puts link
#	if Article.find_by_title("#{link.text}".squish).nil?
#						Article.create!(content: "http://www.cnn.com#{link['href']}",
#						views: 0,
#						article_type: "News",
#						title: "#{a.text}".squish,
#						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/cnn_logo_psiwce.jpg",
#						views: 0,
#						isOld: false,
#						user_id:  1)
#	else
#	end
#end

youtube_links[0..4].each do |link|
	a = link.css("div.yt-lockup-thumbnail a")
	b = link.css("div.yt-lockup-thumbnail div.video-thumb img")
	d = link.at_css("div.yt-lockup-content a")['title']
	if d.squish.empty?
	else
		if Article.find_by_title(d.squish).nil?
						Article.create!(content: "https://www.youtube.com#{a[0]['href']}",
						article_type: "Random",
						title: d.squish,
						image_tag: "#{b[0]['src']}",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
		else
			Article.find_by_title(d.squish).update(isOld: 'false')
		end
	end
end

#aBbc = bbc_links[0].css("a.gs-c-promo-heading")
#bBbc = bbc_links[0].css("a.gs-c-promo-heading h3")

#for i in 0..4
#   if Article.find_by_title("#{bBbc[i].text}".squish).nil?
#						Article.create!(content: "http://www.bbc.com#{aBbc[i]['href']}",
#						views: 0,
#						article_type: "News",
#						title: "#{aBbc[i].text}".squish,
#						image_tag: "http://www.bbc.co.uk/news/special/2015/newsspec_10857/bbc_news_logo.png?cb=1",
#						views: 1 + rand(1324),
#						isOld: false,
#						user_id:  1)
#	else
#		Article.find_by_title("#{bBbc[i].text}".squish).update(isOld: 'false')
#	end
#end

theGuardian_links[0..4].each do |link|
	a = link.css("a")
	if Article.find_by_title("#{link.text}".squish).nil?
			Article.create!(content: "#{a[0]['href']}",
 						article_type: "News",
						title: "#{link.text}".squish,
						image_tag: "http://fontslogo.com/wp-content/uploads/2013/03/The-Guardian-Logo-Font.jpg",
						views: 1 + rand(1324),
						isOld: false,
						user_id:  1)
	else
		Article.find_by_title("#{link.text}".squish).update(isOld: 'false')
	end
end

end
end
