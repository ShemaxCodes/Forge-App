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
    @user = User.find_by(id: session[:user_id])
    @business = Business.new(business_params)
   if @business.save
        redirect_to business_path_url
   else 
        redirect_to new_business_path_url
   end 
end 



def show 
    user = current_user
    if logged_in?
        @business = user.business.find_by(id: params[:id])
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
    params.require(:business).permit(:title, :image, :category, :city, :state, :user_id, :category_id, :description)
end
end  