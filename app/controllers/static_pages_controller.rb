class StaticPagesController < ApplicationController
  def home
    @subscription = Subscription.new
    @articles = Article.all.sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def laugh
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Laugh").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Laugh").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def game
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Game").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Game").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def news
    @subscription = Subscription.new
    @articles = Article.where(article_type: "News").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "News").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def tech
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Tech").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Tech").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def social
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Social").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Social").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def sports
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Sports").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Sports").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def random
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Random").sort_by! { |a| [-a.get_upvotes.size, -a.views, -a.id]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Random").sort_by! { |a| [-a.rank, -a.views, -a.id]}
  end

  def about
  end
end
