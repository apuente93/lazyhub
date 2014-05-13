class AddUpvotedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :upvoted, :boolean, default: false
  end
end
