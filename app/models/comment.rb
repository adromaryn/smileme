class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	self.per_page = 10
end
