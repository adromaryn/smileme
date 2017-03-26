class VideoPost < ApplicationRecord
	belongs_to :post, optional: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :link, presence: true
end
