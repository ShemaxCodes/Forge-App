Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  root 'welcome#home'
  
  
  get "/signup", to: "users#new", as: 'new_user_path'
  
  resources :users 
  resources :businesses
  resources :categories
  
  post "/businesses/:id/delete", to: "businesses#destroy"

  get "/login", to: "sessions#new", as: 'login_path'
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout_path'
  get '/logout', to: "sessions#destroy"
  resources :sessions

  

end
