class StaticPagesController < ApplicationController
  def home
    @subscription = Subscription.new
    @articles = Article.all.sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| [-a.rank, -a.views]}
  end

  def laugh
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Laugh").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Laugh").sort_by! { |a| [-a.rank, -a.views]}
  end

  def game
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Game").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Game").sort_by! { |a| [-a.rank, -a.views]}
  end

  def news
    @subscription = Subscription.new
    @articles = Article.where(article_type: "News").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "News").sort_by! { |a| [-a.rank, -a.views]}
  end

  def tech
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Tech").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Tech").sort_by! { |a| [-a.rank, -a.views]}
  end

  def social
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Social").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Social").sort_by! { |a| [-a.rank, -a.views]}
  end

  def sports
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Sports").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Sports").sort_by! { |a| [-a.rank, -a.views]}
  end

  def random
    @subscription = Subscription.new
    @articles = Article.where(article_type: "Random").sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.where(article_type: "Random").sort_by! { |a| [-a.rank, -a.views]}
  end

  def about
  end
end
