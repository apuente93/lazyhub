class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def game
  end

  def laugh
  end

  def news
  end

  def random
  end

  def about
  end

  def contact
  end
end
