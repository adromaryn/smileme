class PicPost < ApplicationRecord
  belongs_to :post, optional: true
  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, presence: true, length: { maximum: 200 }
  validates :image, presence: true
end
