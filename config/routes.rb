Rails.application.routes.draw do
  get "/" => "session#create"
  post "/session" => "session#create"
  # post "/users" => "users#create"
  get "/todoitems" => "todoitems#index"
  
  resources :todoitems
  resources :users
end
