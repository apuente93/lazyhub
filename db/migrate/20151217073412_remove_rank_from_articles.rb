class RemoveRankFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :rank, :integer
  end
end
