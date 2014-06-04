class RemoveUpvotedFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :upvoted, :boolean
  end
end
