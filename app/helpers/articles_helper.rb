module ArticlesHelper
	def upvote
    	self.increment!(:upvote)
	end 
end