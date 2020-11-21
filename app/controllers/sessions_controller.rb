class SessionsController < ApplicationController 
   
def login
    if @user == user_id
        redirect_to '/'
end

def create
    session[:username] = params[:username]
    redirect_to '/'
end 

def logout
    session.clear
    redirect_to "/login"
end



end 

#question about users controller and sessions 