class RemoveDownvotedFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :downvoted, :boolean
  end
end
