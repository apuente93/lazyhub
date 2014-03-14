class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :upvote
      t.integer :downvote
      t.text :content

      t.timestamps
    end
  end
end
