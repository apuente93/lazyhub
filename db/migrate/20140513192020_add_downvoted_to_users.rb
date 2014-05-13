class AddDownvotedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :downvoted, :boolean, default: false
  end
end
