class BusinessesController < ApplicationController
    #before_action :logged_in?, only: [:show, :edit, :update, :destroy]
    before_action :current_user, only: [:show, :index, :new, :create, :edit]
    protect_from_forgery
    #skip_before_action :verify_authenticity_token

def index 
    if current_user
        @businesses = @current_user.businesses

      else
        @businesses = Business.all
    end
    #byebug
end


def new
    if current_user
        #@user = User.find_by(id: session[:user_id])
        @business = Business.new
    else 
        redirect_to login_path, notice: "User not found"
    end 
    #byebug
    #@business = Business.new
end 

def create
    @business = Business.new(business_params) 
   if @business.save
    current_user.businesses << @business
    #session[:user_id] = @user.id
        redirect_to user_businesses_path
   else 
        redirect_to new_user_business_path
   end 
end 



def show 

    if current_user
        #byebug
        @business = @current_user.businesses.find_by(id: params[:id])
        render :show
        
    else 
        redirect_to login_path
    end
    #byebug
end 


def edit 
    if !logged_in?
        redirect_to login_path
    end
    @business = Business.find_by(user_id: params[:user_id])
        if @business.title != nil || @business.description != nil 
                render :edit
            else 
                redirect_to new_user_business_path
            end 
        
end 

def update
    business = Business.find_by(id: params[:id])
    business.update(business_params)
    business.save
    redirect_to user_businesses_path
end 

def destroy
    @business = Business.find_by(id: params[:id])
    @business.destroy
    redirect_to user_businesses_path
end

private




def business_params
    params.require(:business).permit(:title, :image, :city, :state, :user_id, :category_id, :description)
end
end  