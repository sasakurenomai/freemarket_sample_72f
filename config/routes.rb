Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'
  resources :items, only: [:new, :show, :edit, :destroy] do
    resources :comments, only: :create
  end
  resources :users, only: [:show]
  resources :buyers_sellers, only: [:show]
end
