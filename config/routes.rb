Rails.application.routes.draw do
  get 'sessions/new'

  resources :items
  resources :carts
  resources :users
  
  root 'dashboard#index'
  
  
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  
  resources :orders, except: [:create, :new]
  post 'orders/placeorder' => 'orders#placeorder'
  get 'allorders' => 'orders#all'
  
  get 'cart' => 'carts#index'
  delete 'cart/:id' => 'carts#deletecart'
  post 'cart/:id' => 'carts#addcart'
  
  
  
  
  
end
