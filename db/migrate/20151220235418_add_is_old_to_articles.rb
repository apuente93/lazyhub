class AddIsOldToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :isOld, :boolean
  end
end
