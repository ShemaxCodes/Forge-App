class BusinessesController < ApplicationController
    before_action :logged_in?, only: [:show, :edit, :update, :destroy]
    protect_from_forgery
    #skip_before_action :verify_authenticity_token

def index 
    @businesses = Business.all
end 

def new
    if logged_in?
        @user = User.find_by(id: session[:user_id])
        @business = Business.new
        #render :new 
    else 
        redirect_to login_path
    end 
    #@business = Business.new
end 

def create
    @business = Business.new(business_params)
    #binding.pry
   if @business.save
    session[:user_id] = @user_id
        redirect_to businesses_path
   else 
        redirect_to new_business_path
   end 
end 



def show 

    if logged_in?
        @business = Business.find_by(id: params[:id])
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
        if @business.title != nil || @business.description != nil 
                render :edit
            else 
                redirect_to new_business_path
            end 
        
end 

def update
    business = Business.find_by(id: params[:id])
    business.update(business_params)
    business.save
    redirect_to businesses_path
end 

def destroy
    @business = Business.find_by(id: params[:id])
    @business.destroy
    redirect_to businesses_path
end

private
def business_params
    params.require(:business).permit(:title, :image, :city, :state, :user_id, :category_id, :description)
end
end  