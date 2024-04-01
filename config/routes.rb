Rails.application.routes.draw do
  devise_for :users
  root to: 'houseworks#index'
  resources :houseworks, only: [:index]
end
