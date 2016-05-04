class Item < ActiveRecord::Base
    has_many :carts
    has_many :users, through: :carts
    
    has_many :itemlist
    has_many :orders, through: :itemlist
end
