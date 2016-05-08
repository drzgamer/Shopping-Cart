class DashboardController < ApplicationController
    before_action :signedin
    before_action :setitem, only: [:deletecart] 
    
    def index
            @user = User.find(current_user.id)
    end
    def cart
    end
    
    def addcart
        @item = Cart.new()
        @item.Item_id = params[:item_id]
        @item.User_id = params[:user_id]

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
        if current_user == nil
            redirect_to root_url + "users/sign_in"
        end
    end
end
