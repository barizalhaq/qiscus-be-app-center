Rails.application.routes.draw do
  resources :request_demos
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :subscriptions
  resources :apps
  resources :add_ons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect('/admin')

  # API


  namespace :api do
    namespace :v1 do
      
      get 'add_on', to: 'add_on_api#index'
      get 'add_on/:id', to: 'add_on_api#show'
      post 'add_on/:id/install', to: 'add_on_api#install'
  
    end
  end
end
