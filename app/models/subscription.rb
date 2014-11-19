class Subscription < ActiveRecord::Base
	validates :email, :presence => true # optionally validate format of email
end
