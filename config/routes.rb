Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  root 'welcome#home'
  
  
  get "/signup", to: "users#new", as: 'new_user_path'
  get "/login", to: "sessions#new", as: 'login_path'
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout_path'
  get '/logout', to: "sessions#destroy"


  resources :users 

  resources :users, only: [:show] do
    # nested resource for business
    resources :businesses, only: [:show, :new, :index, :create, :edit, :update]
  end

  resources :businesses, only: [:index]
  resources :categories

  #get 'categories/:category_id/businesses', to: 'businesses#index', as: 'categories_business'
  resources :comments
  
  post "/businesses/:id/delete", to: "businesses#destroy"

  get '/auth/google_oauth2/callback', to: "sessions#google_login"

end
