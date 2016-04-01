class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "70x70>" }, default_url: lambda { |image| ActionController::Base.helpers.asset_path("/assets/ava-:style.png")}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  acts_as_followable
  acts_as_follower
  self.per_page = 10
  
  def self.quick_search(search)
  	if search
  		self.where("login like ?", "%#{search}%")
  	else
  		self.all
  	end
  end
  
  def self.search(login, about)
  	if login != ""
  		if about != ""
  		  self.where("login like ? AND about like ?", "%#{login}%", "%#{about}%")
  		else
  			self.where("login like ?", "%#{login}%")
  		end
  	elsif about != ""
  		self.where("about like ?", "%#{about}%")
  	else
  		self.all
  	end
  end

end
