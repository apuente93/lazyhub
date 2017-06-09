class StaticPagesController < ApplicationController

  def home
    @subscription = Subscription.new
    @page = "home"
    @articles = Article.all.sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)

    @top_laugh = @articles.where(article_type: "Laugh").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_game = @articles.where(article_type: "Game").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_news = @articles.where(article_type: "News").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_tech = @articles.where(article_type: "Tech").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_social = @articles.where(article_type: "Social").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_sports = @articles.where(article_type: "Sports").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_random = @articles.where(article_type: "Random").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}[0]
    @top_articles = [@top_laugh, @top_game, @top_news, @top_tech, @top_social, @top_sports, @top_random]
  end

  def laugh
    @page = "laugh"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Laugh").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Laugh").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def game
    @page = "game"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Game").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Game").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def news
    @page = "news"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "News").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "News").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def tech
    @page = "tech"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Tech").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Tech").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def social
    @page = "social"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Social").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Social").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def sports
    @page = "sports"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Sports").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Sports").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def random
    @page = "random"
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Random").sort_by! { |a| [a.isOld ? 1 : 0, -a.get_upvotes.size, -a.views, -a.created_at.to_i, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Random").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.take(5)
  end

  def about
  end
end
