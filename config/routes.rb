Rails.application.routes.draw do
  resources :todoitems
  resources :users
  get "/" => "session#create"
  post "/session" => "session#create"
  post "/users" => "users#create"
  get "/todoitems" => "todoitems#index"
  post "/todoitems/create" => "todoitems#create"
end
