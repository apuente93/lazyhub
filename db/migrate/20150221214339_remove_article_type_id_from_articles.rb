class RemoveArticleTypeIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :article_type_id, :integer
  end
end
