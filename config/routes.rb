Rails.application.routes.draw do
  devise_for :users
  root to: 'houseworks#index'
  resources :houseworks
  resources :pairs, only: [:new, :create, :destroy]
end
