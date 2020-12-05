class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :edit, :update, :destroy]
  protect_from_forgery
  
  #controller for signing up users

  def new 
    @user = User.new 
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user_id
        #flash[:success] = "Welcome to the Forge App!"
        redirect_to user_path(@user)
      else 
        render :new 
      end 
    end 

  def show
    if current_user
      #@user = User.find(params[:user_id])
      redirect_to business_path_url
    else 
      redirect_to "/"
    
      
    end
  end 

  private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end

