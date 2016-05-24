Rails.application.routes.draw do
  get 'sessions/new'

  resources :items
  resources :carts
  
  root 'dashboard#index'
  
  get 'signup'  => 'users#new'
  
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  
  get 'myaccount' => 'dashboard#index'
  get 'cart' => 'carts#index'
  delete 'cart/:id' => 'carts#deletecart'
  post 'cart/:id' => 'carts#addcart'
  resources :orders, path: '/myaccount/orders'
  
  
end
