class ChangeArticleTitleToText < ActiveRecord::Migration
  def up
    change_column :articles, :title, :text
    change_column :articles, :image_tag, :text
  end
  def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :articles, :title, :string
    change_column :articles, :image_tag, :string
  end
end
