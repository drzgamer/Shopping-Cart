class UsersController < ApplicationController
    before_action :signed_in, only: [:new]
    
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
          render 'new'
        end
    end
    
    
    private

        def user_params
          params.require(:user).permit(:name, :email, :password,
                                       :password_confirmation)
        end
        
        def signed_in
            if logged_in?
             redirect_to root_url
            end
        end
end
