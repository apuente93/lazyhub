class StaticPagesController < ApplicationController

  def home
    @subscription = Subscription.new
    @page = "home"
    @articles2 = Article.all
    @articles = @articles2.paginate(:page => params[:page], :per_page => 20)

    @top_laugh = @articles2.where(article_type: "Laugh")[0]
    @top_game = @articles2.where(article_type: "Game")[0]
    @top_news = @articles2.where(article_type: "News")[0]
    @top_tech = @articles2.where(article_type: "Tech")[0]
    @top_social = @articles2.where(article_type: "Social")[0]
    @top_sports = @articles2.where(article_type: "Sports")[0]
    @top_random = @articles2.where(article_type: "Random")[0]
    @top_articles = [@top_laugh, @top_game, @top_news, @top_tech, @top_social, @top_sports, @top_random]
  end

  def laugh
    @page = "laugh"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Laugh").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Laugh").take(5)
  end

  def game
    @page = "game"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Game").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Game").take(5)
  end

  def news
    @page = "news"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "News").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "News").take(5)
  end

  def tech
    @page = "tech"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Tech").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Tech").take(5)
  end

  def social
    @page = "social"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Social").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Social").take(5)
  end

  def sports
    @page = "sports"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Sports").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Sports").take(5)
  end

  def random
    @page = "random"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Random").paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Random").take(5)
  end

  def about
  end
end
