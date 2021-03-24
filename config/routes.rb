Rails.application.routes.draw do
  resources :todoitems
  resources :users
  get "/" => "session#create"
  post "/session" => "session#create"
  post "/users" => "users#create"
  get "/todoitems" => "todoitems#index"
  post "/todoitems/create" => "todoitems#create"
  post "/todoitems/update" => "todoitems#update"
  post "/todoitems/delete" => "todoitems#destroy"
end
