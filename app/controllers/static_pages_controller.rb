class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
    @top_articles = Article.all.sort_by! { |a| a.rank }
  end

  def laugh
    @articles = Article.where(article_type_id: 1).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
  end

  def game
    @articles = Article.where(article_type_id: 2).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
  end

  def news
    @articles = Article.where(article_type_id: 3).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
  end

  def random
    @articles = Article.where(article_type_id: 4).sort_by! { |a| [-a.get_upvotes.size, -a.views]}.paginate(:page => params[:page], :per_page => 20)
  end

  def about
  end

  def contact
  end
end
