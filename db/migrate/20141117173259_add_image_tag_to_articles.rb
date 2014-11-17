class AddImageTagToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_tag, :string
  end
end
