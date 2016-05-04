class Order < ActiveRecord::Base
    has_one :user, through: :orderlists
    has_one :orderlist
end
