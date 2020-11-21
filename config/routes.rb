Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  root 'welcome#home'
  get "/businesses", to: "businesses#index" 
  get "/users", to: "users#new", as: 'new_users_path'
  get "/users/:id", to: "users#show", as: 'users_path'
  get "/login", to: "sessions#new", as: 'login_path'
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout_path'

  

end
