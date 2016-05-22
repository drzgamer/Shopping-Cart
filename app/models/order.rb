class Order < ActiveRecord::Base
    belongs_to :user
    
    has_many :itemorders
    has_many :items, through: :itemorders
end
