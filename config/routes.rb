Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :show]
  resources :users, only: [:show]
end
