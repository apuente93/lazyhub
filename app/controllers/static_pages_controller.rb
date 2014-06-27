class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.paginate(:page => params[:page], :per_page => 20).order(upvote: :desc, views: :desc)
  end

  def laugh
    @articles = Article.where(article_type_id: 1).paginate(:page => params[:page], :per_page => 20).order(upvote: :desc, views: :desc)
    /@articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}/
  end

  def game
    @articles = Article.where(article_type_id: 2).paginate(:page => params[:page], :per_page => 20).order(upvote: :desc, views: :desc)
    /@articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}/
  end

  def news
    @articles = Article.where(article_type_id: 3).paginate(:page => params[:page], :per_page => 20).order(upvote: :desc, views: :desc)
    /@articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}/
  end

  def random
    @articles = Article.where(article_type_id: 4).paginate(:page => params[:page], :per_page => 20).order(upvote: :desc, views: :desc)
    /@articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}/
  end

  def about
  end

  def contact
  end
end
