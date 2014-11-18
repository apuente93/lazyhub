class AddImageTag2ToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_tag2, :string
  end
end
