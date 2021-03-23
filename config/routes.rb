Rails.application.routes.draw do
  resources :users
  get "/" => "session#create"
  post "/session" => "session#create"
  post "/users" => "users#create"
  get "/todoitems" => "todoitems#index"
  
  resources :todoitems
end
