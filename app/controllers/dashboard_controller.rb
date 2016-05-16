class DashboardController < ApplicationController
    before_action :setitem, only: [:deletecart] 
    
    def index
        
    end
    def cart
        if user_signed_in?
            @user = User.find(current_user.id)
            @cart = @user.items
        else
            @cart = Item.joins(:carts).where(:carts => {:session_id => session.id})
        end
        
        

            
    end
    
    def addcart
        @item = Cart.new()
        @item.Item_id = params[:id]
        if user_signed_in?
            @item.User_id = current_user.id
        else
            @item.session_id = session.id
        end
        

        respond_to do |format|
          if @item.save
            format.html { redirect_to root_url + "myaccount/cart", notice: 'Item was successfully created.' }
            format.json { render :show, status: :created, location: @item }
          else
            format.html { render :new }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
        
    end
    
    def deletecart
        @item.destroy
        respond_to do |format|
          format.html { redirect_to root_url + "myaccount/cart", notice: 'Item was successfully removed.' }
          format.json { head :no_content }
        end
        
    end
    
    
    
    
    
    
    private
    
    def setitem
        @item = Cart.find_by item_id: params[:id]
        
    end
    
    def signedin
        if !user_signed_in?
            redirect_to root_url + "users/sign_in"
        end
    end
end
