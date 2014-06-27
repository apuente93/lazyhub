class AddUpvoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :upvote, :integer
  end
end
