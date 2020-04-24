Rails.application.routes.draw do
  root 'items#top'

  # ユーザー管理
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :users, only: [:show, :edit, :update]

  # クレジットカード
  get 'card/index'
  resources :card, only: [:new, :show, :create, :destroy] do
    collection do
      post 'show', to: 'card#index'
      post 'pay',  to: 'card#create'
    end
  end
  
  resources :items do
    # 検索
    collection do
      get 'search'
    end

    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    # 購入機能
    resources :comments, only: :create
    resources :purchase, only: [:index] do
      member do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end

  resources :buyers_sellers, only: [:show]
end