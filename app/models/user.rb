class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { thumbnail: "130x130#", small: "150x150"}, :path => ":rails_root/public/images/:year/:month/:id/:style/:basename.:extension", :url => "/images/:year/:month/:id/:style/:basename.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :orders, through: :orderlists
         has_many :orderlists
         
         has_many :carts
         has_many :items, through: :carts
         
end
