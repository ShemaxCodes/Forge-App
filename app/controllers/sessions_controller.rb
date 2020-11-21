class SessionsController < ApplicationController 
   
def login
    if @user == user_id
        redirect_to "/"
end

def logout
    session.clear
    redirect_to login_path
end



end 

#question about users controller and sessions 