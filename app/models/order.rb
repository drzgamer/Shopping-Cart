class Order < ActiveRecord::Base
    has_one :user, through: :orderlists
    has_one :orderlist
    
    has_many :itemorders
    has_many :items, through: :itemorders
end
