class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def signup
        #if logged_in?
         redirect to 'businesses' 
       end
   
       render 'signup' 
    end


  def new
    @user = User.new
  end

  def create
    if (user = User.create(user_params))
      session[:user_id] = user.id
      redirect_to "/"
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    #show users all businesses?
  end

  private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end

end  