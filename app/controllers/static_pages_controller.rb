class StaticPagesController < ApplicationController
  def home
    @subscription = Subscription.new
    @articles = Article.all.sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| a.rank }
  end

  def laugh
    @subscription = Subscription.new
    @articles = Article.where(article_type_id: 1).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| a.rank }
  end

  def game
    @subscription = Subscription.new
    @articles = Article.where(article_type_id: 2).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| a.rank }
  end

  def news
    @subscription = Subscription.new
    @articles = Article.where(article_type_id: 3).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| a.rank }
  end

  def random
    @subscription = Subscription.new
    @articles = Article.where(article_type_id: 4).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| a.rank }
  end

  def about
  end

  def contact
  end
end
