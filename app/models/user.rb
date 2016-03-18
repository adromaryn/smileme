class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "70x70>" }, default_url: "/assets/ava-:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  def self.quick_search(search)
  	if search
  		self.where("login like ?", "%#{search}%")
  	else
  		self.all
  	end
  end

end
