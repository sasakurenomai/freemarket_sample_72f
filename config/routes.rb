Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :show]
  resources :users, only: [:show]

  get 'card/new'
  get 'card/index'

  resources :card, only: [:show, :create, :show, :destroy] do
    collection do
      post 'show', to: 'card#index'
      post 'pay',  to: 'card#create'
      post 'destroy', to: 'card#destroy'
    end
  end
  
end
 
