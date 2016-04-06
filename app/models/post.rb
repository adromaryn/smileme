class Post < ActiveRecord::Base
	belongs_to :user
	has_one :pic_post
	has_one :video_post
	has_many :comments
	self.per_page = 10
	acts_as_votable
end
