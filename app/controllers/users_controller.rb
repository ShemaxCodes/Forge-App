class UsersController < ApplicationController
    #skip_before_action :verified_user, only: [:new, :create]


  def new 
    @user = User.new 
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user_id
        #flash[:success] = "Welcome to the Forge App!"
        redirect_to business_path
      else 
        render :new 
      end 
    end 

  def show
    @user = User.find(params[:user_id])
  end 

  private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password_digest, :password_confirmation)
    end
end

