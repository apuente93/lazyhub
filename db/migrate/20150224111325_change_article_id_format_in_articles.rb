class ChangeArticleIdFormatInArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :id, :bigint
  end
end
