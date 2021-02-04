Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :subscriptions
  resources :apps
  resources :add_ons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # API
  namespace :api do
    namespace :v1 do
      resources :add_on, controller: 'add_on_api', only: [:index, :show]
    end
  end
end
