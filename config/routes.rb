Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
  resources :boxes
  resources :order_items
  resource :cart

  get 'admin/boxes/add_item'

  get 'box/remove_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'

  root 'home#index'
  
end
