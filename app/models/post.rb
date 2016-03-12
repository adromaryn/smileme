class Post < ActiveRecord::Base
	belongs_to :user
	has_one :pic_post
	has_one :video_post
	self.per_page = 1
end
