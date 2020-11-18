class UsersController < ApplicationController
    #skip_before_action :verified_user, only: [:new, :create]


  def new 
    @user = User.new 
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user_id
        redirect_to @user 
      else 
        render :new 
      end 
    end 



  private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end

