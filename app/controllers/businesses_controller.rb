class BusinessesController < ApplicationController
    
def index 
    @businesses = Business.all 
end 

def new
    if logged_in?
        render :new 
    else 
        redirect_to login_path
    end 
    #@business = Business.new
end 

def create
    user = current_user
    if params
end 


def show 

end 

def edit 

end 

def update
end 

def destroy

end
end  