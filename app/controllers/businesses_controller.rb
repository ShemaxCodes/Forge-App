class BusinessesController < ApplicationController
    before_action :logged_in?, only: [:show, :edit, :update, :destroy]
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
    @business = Business.new(business_params)
    if business_params.empty?
        redirect_to new_business_path_url
    else
        @business.save
        redirect_to business_show_path_url(user) 
    end 
end 



def show 
    @business = Business.new(business_params)
    user = current_user
    if logged_in?
        @business= Business.find params[:id]
        render :show
    else 
        redirect_to login_path
    end
end 


def edit 
    if !logged_in?
        redirect_to login_path
    end
    @business = Business.find_by(id: params[:id])
        if @business.title !=nil || @business.description !=nil  
            if current_user.id == @business.user_id 
                render :edit
            else 
                redirect_to new_business_path
            end 
        end 
end 

def update
end 

def destroy

end

private
def business_params
    params.permit(:title, :image, :category, :city, :state, :user_id, :category_id, :description)
end
end  