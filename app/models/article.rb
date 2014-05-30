class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	def feed
    	# This is preliminary. See "Following users" for the full implementation.
    	Comment.where("article_id = ?", id)
  	end
end