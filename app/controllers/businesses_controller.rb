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
    @business = Business.new(business_params)
    if @business.save && business_params.empty?
        redirect_to new_business_path
    end
    @business = Business.create(business_params)
    @business.save
    redirect_to business_path 
end 


def show 
    @businesses = Business.all 
    user = current_user
    if logged_in?
        @business = Business.find_by(id: session[:user_id])
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
    params.permit(:title, :city, :state, :user_id, :category_id, :description)
end
end  