class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  before_action :signed_in, only: [:index,:show, :destroy, :placeorder]
  before_action :check_admin, only: [:destroy, :all]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where user_id: current_user.id

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = @order.itemorders
  end
  
  def all
    @orders = Order.all
  end

  def placeorder
    @user = User.find(current_user.id)
    @total = 0
    @total_items = 0
    @continue = 0
    flash[:notice] = []
    
      
    #Tests if the cart has enough stock, if not it removes from cart 
    @user.carts.each  do |cart|
      if (cart.quantity > cart.item.quantity)
        flash[:notice] << "Not enough stock in store for #{cart.itemz.name}"
        cart.destroy
        @total_items += 1
      else
        @continue += 1
        @total_items += 1
      end
    end
    
    #Test weather first test was sucessful, if it was it continues, if not it redirects back to cart with notice
    if @continue == @total_items
      @user.carts.each  do |cart|
        @total += (cart.item.price * cart.quantity) 
        cart.updateqty(cart.quantity)
      end
    else
      redirect_to root_url + "cart" and return
    end
    
    @order = Order.create
    @order.user_id = @user.id
    @user.carts.each do |cart|
      @itemO = Itemorder.new
      
      @itemO.quantity = cart.quantity
      @itemO.item_id = cart.item_id
      @itemO.order_id = @order.id
      @itemO.save
      
    end
    
    @order.total = @total
    @order.datetime = Time.new

    
    respond_to do |format|
      if @order.save
        @user.item_ids = ""
        @user.save
        
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    
    

    
    
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      print @order.user_id.to_s + "order id"
      print current_user.id.to_s + "my id"

      #cant seem to get the or to work properly
      # if !current_user.try(:isadmin) || @order.user_id != current_user.id
      #   flash[:notice] = 'That was not your order.'
      #   redirect_to orders_url
      # end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total, :datetime)
    end
    
    def signed_in
       if !logged_in?
         redirect_to root_url + "login"
       end
    end
    
    def check_admin
      if !current_user.try(:isadmin?)
         redirect_to orders_url
      end
    end
end
