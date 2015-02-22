class Article < ActiveRecord::Base
	before_create :randomize_id
	acts_as_votable
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :content, presence: true
	validates :article_type, presence: true
    validates :user_id, presence: true

	def feed
    	# This is preliminary. See "Following users" for the full implementation.
    	Comment.where("article_id = ?", id)
  	end

  	private
	def randomize_id
  	begin
    	self.id = SecureRandom.random_number(1_000_000_000_000)
  		end while Article.where(id: self.id).exists?
	end
end