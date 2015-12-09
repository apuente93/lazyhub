require 'rubygems'
require 'nokogiri'
require 'open-uri'

namespace :webcrawl_proc do
  desc "Webcrawls famous entertainment sites for data"
  task my_task: :environment do
  	espn_page = Nokogiri::HTML(open("http://espn.go.com"))   
espn_links = espn_page.css("div#content.container div.span-2.ts-right.mod-skirmish div.mod-container.mod-tabs.mod-no-footer.top-headlines div.mod-content ul.headlines li a")

goal_page = Nokogiri::HTML(open("http://www.goal.com/en-us/"))   
goal_links = goal_page.css("div.home-sidebar div.tab-content a")

cnn_page = Nokogiri::HTML(open("http://cnn.com"))   
cnn_links = cnn_page.css("section#homepage1-zone-1 h3.cd__headline a")

gag_page = Nokogiri::HTML(open("http://9gag.com"))   
gag_links = gag_page.css("section#list-view-2 article.badge-entry-container header h2.badge-item-title a")

college_page = Nokogiri::HTML(open("http://www.collegehumor.com/"))   
college_links = college_page.css("div.col-sm-6 a")

addicting_page = Nokogiri::HTML(open("http://www.addictinggames.com/hot-games/index.jsp"))   
addicting_links = addicting_page.css("div.gameSlot")

miniclip_page = Nokogiri::HTML(open("http://www.miniclip.com/games/genre-23/top-100/en/#t-n-H"))   
miniclip_links = miniclip_page.css("a.game-icon")

cnet_page = Nokogiri::HTML(open("http://www.cnet.com/news/"))   
cnet_links = cnet_page.css("div.assetBody a")

pcmag_page = Nokogiri::HTML(open("http://www.pcmag.com/"))   
pcmag_links = pcmag_page.css("div#news-stack a")

buzz_page = Nokogiri::HTML(open("http://www.buzzfeed.com/buzz"))   
buzz_links = buzz_page.css("div.lede__body a.lede__link")

ew_page = Nokogiri::HTML(open("http://www.ew.com/"))   
ew_links = ew_page.css("section.block-top_stories a")

digg_page = Nokogiri::HTML(open("http://digg.com/"))   
digg_links = digg_page.css("a.story-title-link")

ebaum_page = Nokogiri::HTML(open("http://www.ebaumsworld.com/"))   
ebaum_links = ebaum_page.css("div.featureDetails a")

college_links.each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.collegehumor.com#{link['href']}",
						views: 0,
						article_type: "Random",
						title: "#{link.text}".squish,
						image_tag: "http://www.technobuffalo.com/wp-content/uploads/2012/03/College-Humor-logo-640x359.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
		else
		end
	end
end

goal_links.each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.goal.com#{link['href']}",
						views: 0,
						article_type: "Sports",
						title: "#{link.text}".squish,
						image_tag: "http://static.goal.com/280900/280936_heroa.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

pcmag_links.each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						views: 0,
						article_type: "Tech",
						title: "#{link.text}".squish,
						image_tag: "http://www.getqardio.com/wp-content/uploads/2014/12/PCMag2.png",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

ebaum_links.each do |link|
	if Article.find_by_title("#{link.text}".strip_heredoc.lstrip.lines.first.squish).nil?
						Article.create!(content: "http://www.ebaumsworld.com#{link['href']}",
						views: 0,
						article_type: "Laugh",
						title: "#{link.text}".strip_heredoc.lstrip.lines.first.squish,
						image_tag: "http://cdn.ebaumsworld.com/mediaFiles/picture/366483/82271662.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

miniclip_links.each do |link|
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.miniclip.com#{link['href']}",
						views: 0,
						article_type: "Game",
						title: "#{link.text}".squish,
						image_tag: "http://www.lilireviews.com/wp-content/uploads/2013/08/Miniclip01-Logo1.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

digg_links.each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						views: 0,
						article_type: "Social",
						title: "#{link.text}".squish,
						image_tag: "http://img2.wikia.nocookie.net/__cb20121224123923/logopedia/images/3/32/Digg_Logo.png",
						rank: 0,
						views: 0,
						user_id:  1)
		else
		end
	end
end

ew_links.each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						views: 0,
						article_type: "Social",
						title: "#{link.text}".squish,
						image_tag: "http://www.majorcineplex.com/uploads/content/images/entertainment-weekly-logo.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
		else
		end
	end
end

buzz_links.each do |link|
	if "#{link.text}".squish.empty?
	else
		if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.buzzfeed.com#{link['href']}",
						views: 0,
						article_type: "Social",
						title: "#{link.text}".squish,
						image_tag: "http://s3-ak.buzzfed.com/static/images/global/buzzfeed.jpg?v=201502061701",
						rank: 0,
						views: 0,
						user_id:  1)
		else
		end
	end
end

addicting_links.each do |link|
	a = link.css("p a")
	b = link.css("div.iconContainer a")
	if Article.find_by_title("#{a.text}".squish).nil?
						Article.create!(content: "http://www.addictinggames.com#{b[0]['href']}",
						views: 0,
						article_type: "Game",
						title: "#{a.text}".squish,
						image_tag: "http://img2.wikia.nocookie.net/__cb20131228011010/logopedia/images/c/c2/Addicting_Games_974.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

cnet_links.each do |link|
	a = link.css("h3")
	if "#{a.text}".squish.empty?
	else
		if Article.find_by_title("#{a.text}".squish).nil?
						Article.create!(content: "http://www.cnet.com#{link['href']}",
						views: 0,
						article_type: "Tech",
						title: "#{a.text}".squish,
						image_tag: "https://rimblogs.files.wordpress.com/2014/12/cnet-500x237.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
		else
		end
	end
end

gag_links.each do |link|
	a = "#{link['href']}"
	a.slice! "/gag/"
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.9gag.com#{link['href']}",
						views: 0,
						article_type: "Random",
						title: "#{link.text}".squish,
						image_tag: "http://img-9gag-ftw.9cache.com/photo/#{a}_460s.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

espn_links.each do |link| 
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "#{link['href']}",
						views: 0,
						article_type: "Sports",
						title: "#{link.text}".squish,
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/espn_logo_cuaiiw.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end

#reddit_links.each do |link| 
	#a = link.css("a.thumbnail")
	#c = a.at_css("img")['src']
	#b = link.css("a.title")
	#if Article.find_by_title("#{b.text}".squish).nil?
	#					Article.create!(content: "#{a[0]['href']}",
	#					views: 0,
	#					article_type: "Laugh",
	#					title: "#{b.text}".squish,
	#					image_tag: "http://famouslogos.net/images/reddit-logo.jpg",
	#					rank: 0,
	#					views: 0,
	#					user_id:  1)
	#else
	#end
#end

cnn_links.each do |link| 
	if Article.find_by_title("#{link.text}".squish).nil?
						Article.create!(content: "http://www.cnn.com#{link['href']}",
						views: 0,
						article_type: "News",
						title: "#{link.text}".squish,
						image_tag: "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/cnn_logo_psiwce.jpg",
						rank: 0,
						views: 0,
						user_id:  1)
	else
	end
end
  end

end
