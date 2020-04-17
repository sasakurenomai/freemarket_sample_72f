Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'
  
  resources :users, only: [:show]

  #get 'アクション', to: 'コントローラー#アクション'
  #get 'コントローラー/アクション'
  get 'card/new'
  get 'card/index'
  
  resources :card, only: [:show, :create, :destroy] do
    collection do
      post 'show', to: 'card#index'
      post 'pay',  to: 'card#create' 
    end
  end
  
  
  resources :items, only: [:new, :show, :edit, :destroy] do
    resources :purchase, only: [:index] do
      member do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  
end
 
