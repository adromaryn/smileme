class VideoPost < ActiveRecord::Base
	belongs_to :post
  validates :title, presence: true, length: { maximum: 200 }
  validates :link, presence: true
end
