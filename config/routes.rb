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
  get 'card/index'

  resources :card, only: [:show, :create, :show, :destroy] do
    collection do
      post 'show', to: 'card#index'
      post 'pay',  to: 'card#create'
      post 'destroy', to: 'card#destroy'
    end
  end
  
end
 
