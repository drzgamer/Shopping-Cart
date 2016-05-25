class CartsController < ApplicationController
    before_action :setitem, only: [:deletecart] 
    
    def index
        if logged_in?
            @user = User.find(current_user.id)
            @cart = @user.carts
        else
            @cart = Cart.where session_id: request.session_options[:id]
            print request.session_options[:id]
        end
    end
    
    def addcart
        
        if logged_in?
            @cart = Cart.where  user_id: current_user.id
        else
            @cart = Cart.where session_id: request.session_options[:id]
            
        end
        
        @cart.each do |cart|
            if cart.item_id == params[:id]
                flash[:notice] << "Not enough stock in store for #{cart.itemz.name}"
                redirect_to carts_url and return
            end
        end
    
        
        
        @item = Cart.new()
        @item.item_id = params[:id]
        if logged_in?
            @item.user_id = current_user.id
        else
            @item.session_id = session.id
        end
        @item.quantity = params[:quantity]

        respond_to do |format|
          if @item.save
            format.html { redirect_to root_url + "cart", notice: 'Item was successfully created.' }
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
          format.html { redirect_to root_url + "cart", notice: 'Item was successfully removed.' }
          format.json { head :no_content }
        end
        
    end
    
    
    private
    
    def setitem
        @item = Cart.find_by id: params[:id]
        
    end
end
