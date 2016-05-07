Rails.application.routes.draw do
  resources :orders
  resources :items
  devise_for :users
  
  root 'dashboard#index'
  
  get 'myaccount' => 'dashboard#index'
  get 'myaccount/cart' => 'dashboard#cart'
  delete 'myaccount/cart/:id' => 'dashboard#deletecart'
  post 'myaccount/cart' => 'dashboard#addcart'
  
  
end
