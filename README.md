# README

Forge
Forge is an application that was created to showcase businesses in the South Carolina area. Forge brings the community together in hopes of finding a business that may not be available or known to Google.

Installation
This application used the following versions of Ruby and Rails for development.

Ruby 2.6.1-p33
Rails 6.0.3.4
You will need both available on your system to properly launch it. Once you have forked the repository and copied your cloned URL the next step is to open it in your code editor.

Next run the following to install all your code dependencies. 

bundle install

If your terminal does not show you are in the current directory you will need to give yourself access so that you can launch the application.


#Run the following to get into the current directory:
cd forge-app 

#Example of being in the current directory
root@LAPTOP-6AGP0TPS:~/forge-app#  % 

Once you are in the application run the following to launch a local server so that you can interact with the application through a browser:

rails s
Afterwards, your terminal will give you a list of information including where you need to navigate in your browser to see the application. This will be similar to this:

=> Booting Puma
=> Rails 6.0.3.4 application starting in development 
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.6 (ruby 2.6.1-p33), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://127.0.0.1:3000
* Listening on tcp://[::1]:3000
* Listening on tcp://127.94.0.1:3000
Use Ctrl-C to stop

# Gems to Install 

gem bcrypt - This gem (an ActiveRecord macro) creates uncodeable passwords.

gem omniauth-google-oauth2 - This gem allows users to sign in with Google.

gem byebug - debugging tool for Rails

