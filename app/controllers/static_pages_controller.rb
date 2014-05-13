class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    @articles.sort_by! { |a| [-a.upvote, -a.views]}
  end

  def laugh
    @articles = Article.where(article_type_id: 1)
  end

  def game
    @articles = Article.where(article_type_id: 2)
  end

  def news
    @articles = Article.where(article_type_id: 3)
  end

  def random
    @articles = Article.where(article_type_id: 4)
  end

  def about
  end

  def contact
  end
end
