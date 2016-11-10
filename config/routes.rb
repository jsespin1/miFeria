Rails.application.routes.draw do

  resources :products

  resource :cart
  
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'

  root 'home#index'
  
end
