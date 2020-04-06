Rails.application.routes.draw do
  devise_for :users
  root 'items#top'
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show]
end
