Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'
  resources :items, only: [:new, :show, :edit, :destroy]
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

