Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new]
  get 'items/show'
  resources :users, only: [:show]
end
