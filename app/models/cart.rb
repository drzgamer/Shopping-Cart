class Cart < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :item
    
    def itemz
        @item = Item.find(self.item_id)
        return @item
    end
    
    def updateqty(quantity)
        @item = Item.find(self.item_id)
        @item.quantity = @item.quantity - quantity
        @item.save
    end
end
