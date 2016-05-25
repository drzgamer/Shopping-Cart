class DashboardController < ApplicationController
    before_action :setitem, only: [:deletecart] 
    
    def index
        
    end
end
