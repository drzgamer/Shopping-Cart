class Itemlist < ActiveRecord::Base
    has_many :items
    has_many :orders
end
