class BusinessesController < ApplicationController
    protect_from_forgery
    #skip_before_action :verify_authenticity_token

def index 
    @businesses = Business.all 
end 

def new
    @business = Business.new
    if logged_in?
        render :new 
    else 
        redirect_to login_path
    end 
    #@business = Business.new
end 

def create
    user = current_user
    if params[:title].empty? || params[:description].empty?
        redirect_to new_business_path
    end
    business = Business.build(business_params)
    redirect_to business_path #change to collection_path/add business_path to nav bar
end 


def show 
    if logged_in?
        @business = Business.find_by_id(params[:id])
        render :show
    else 
        redirect_to login_path
    end
end 


def edit 

end 

def update
end 

def destroy

end

private
def business_params
    params.require(:business).permit(:title, :city, :state, :user_id, :category_id, :description)
end
end  