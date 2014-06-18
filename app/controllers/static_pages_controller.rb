class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    @articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}
  end

  def laugh
    @articles = Article.where(article_type_id: 1)
    @articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}
  end

  def game
    @articles = Article.where(article_type_id: 2)
    @articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}
  end

  def news
    @articles = Article.where(article_type_id: 3)
    @articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}
  end

  def random
    @articles = Article.where(article_type_id: 4)
    @articles.sort_by! { |a| [-a.get_upvotes.size, -a.views]}
  end

  def about
  end

  def contact
  end
end
