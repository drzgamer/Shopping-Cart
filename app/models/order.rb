class Order < ActiveRecord::Base
    belongs_to :user
    
    has_many :itemorders, dependent: :destroy
    has_many :items, through: :itemorders
end
