class Article < ActiveRecord::Base
	acts_as_votable
	has_many :comments, dependent: :destroy
	validates :content, presence: true
	validates :article_type, presence: true
	def feed
    	# This is preliminary. See "Following users" for the full implementation.
    	Comment.where("article_id = ?", id)
  	end
end