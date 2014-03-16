class AddArticleTypeIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_type_id, :integer
  end
end
