Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :show]
  resources :users, only: [:show]

  get 'card/new'
  get 'card/show'

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay',  to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
end

