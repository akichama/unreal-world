Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index,:show,:destroy]
    resources :posts, only: [:show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  root controller: :homes, action: :top
  get :about, controller: :homes, action: :about
  get :search, controller: :searches, action: :search

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    get :follows
    get :followers
    collection do
      get :mypage
      get 'favorites', to: 'favorites#index'
    end
  end


  resources :posts do
    resources :post_comments, only: [:create, :destroy]

    resource :favorites, only: [:create, :destroy]
    resources :favorite_users, only: [:index]
  end

  resources :notifications, only: [:index, :destroy, :update]
end
