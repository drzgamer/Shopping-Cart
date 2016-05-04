class Orderlist < ActiveRecord::Base
    has_one :user
    has_many :orders
end
