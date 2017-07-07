Rails.application.routes.draw do


  devise_for :users
  get 'visitor/index'

  resources :users
  resources :order_services
  resources :order_models
  resources :orders
  resources :services
  resources :models
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
        resources :brands
        resources :models
        resources :orders
        resources :services
    end
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'api/v1'
    end
  end
  root to: "visitor#index"
end
