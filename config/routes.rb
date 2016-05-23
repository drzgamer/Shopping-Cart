Rails.application.routes.draw do
  get 'sessions/new'

  resources :items
  
  root 'dashboard#index'
  
  get 'signup'  => 'users#new'
  
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  
  get 'myaccount' => 'dashboard#index'
  get 'myaccount/cart' => 'dashboard#cart'
  delete 'myaccount/cart/:id' => 'dashboard#deletecart'
  post 'myaccount/cart/:id' => 'dashboard#addcart'
  resources :orders, path: '/myaccount/orders'
  
  
end
