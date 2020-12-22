class WelcomeController < ApplicationController 


def home 
   
end 

def index 
 if logged_in?
    @user = current_user
    @businesses = current_user.businesses
    render :show
 else 
    redirect_to login_path
 end
end

end 