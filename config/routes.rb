Rails.application.routes.draw do
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :orders do
    collection do
      post :accept
      post :cancel
      post :pay
    end
  end
end
