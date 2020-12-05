class UsersController < ApplicationController
    

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
    if logged_in?
      @user = User.find(params[:user_id])
      @user.business.build
    else 
      redirect_to "/"
    
      
    end
  end 

  private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end

