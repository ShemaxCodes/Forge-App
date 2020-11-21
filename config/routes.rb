Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  root 'welcome#home'
  get "/businesses", to: "businesses#index" 
  get "/users", to: "users#new"
  get "/users/new", to: "users#show"

end
