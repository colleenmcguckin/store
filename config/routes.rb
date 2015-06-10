Rails.application.routes.draw do

 devise_for :users
 root to: 'products#index'
 get "/" => 'products#index'
 get "/products" => 'products#index'
 get "/products/new" => 'products#new'
 post "/products/search" => 'products#search'
 get "/products/:id" => 'products#show'
 post "/products" => 'products#create'
 get "/products/:id/edit" => 'products#edit'
 patch "/products/:id" => 'products#update'
 delete "/products/:id" => 'products#destroy'
end
