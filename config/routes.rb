Rails.application.routes.draw do
  resources :items
  
  root 'dashboard#index'
  
  get 'myaccount' => 'dashboard#index'
  get 'myaccount/cart' => 'dashboard#cart'
  delete 'myaccount/cart/:id' => 'dashboard#deletecart'
  post 'myaccount/cart/:id' => 'dashboard#addcart'
  resources :orders, path: '/myaccount/orders'
  
  
end
