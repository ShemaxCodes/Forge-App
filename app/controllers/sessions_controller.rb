class SessionsController < ApplicationController 
   
def login
    if @user == user_id
        redirect_to '/'
    end
end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
    else 
        flash.now[:danger] = "Invalid email/password. Please try again."
        render :new
    end 
end 

def destroy
    log_out if logged_in?
    redirect_to '/'
end



end 
