class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	self.per_page = 10
end
