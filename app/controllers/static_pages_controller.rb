class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def laugh
    @articles = Article.find(:all, :conditions => { :article_type_id => 1 })
  end

  def game
    @articles = Article.find(:all, :conditions => { :article_type_id => 2 })
  end

  def news
    @articles = Article.find(:all, :conditions => { :article_type_id => 3 })
  end

  def random
    @articles = Article.find(:all, :conditions => { :article_type_id => 4 })
  end

  def about
  end

  def contact
  end
end
