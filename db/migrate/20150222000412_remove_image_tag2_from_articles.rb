class RemoveImageTag2FromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :image_tag2, :string
  end
end
