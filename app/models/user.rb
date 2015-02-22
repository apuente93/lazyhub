class User < ActiveRecord::Base
  acts_as_voter
  has_many :comments, dependent: :destroy
  has_many :articles
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, length: { minimum: 6 }
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Comment.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end

end
