Rails.application.routes.draw do
  get 'visitor/index'

  resources :users
  resources :order_services
  resources :order_models
  resources :orders
  resources :services
  resources :models
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "visitor#index"
end
