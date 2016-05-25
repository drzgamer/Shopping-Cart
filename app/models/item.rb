class Item < ActiveRecord::Base
    has_attached_file :image, styles: { thumbnail: "130x130#", tiny: "75x75" ,small: "150x150", med: "300x300", large: "1024x1024" }, :path => ":rails_root/public/images/:year/:month/:id/:style/:basename.:extension", :url => "/images/:year/:month/:id/:style/:basename.:extension"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    has_many :carts
    has_many :Users, through: :Carts
    
    has_many :itemorder
    has_many :orders, through: :itemorder
end
