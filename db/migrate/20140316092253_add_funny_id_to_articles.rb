class AddFunnyIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :funny_id, :integer
  end
end
