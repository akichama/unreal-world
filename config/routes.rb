Rails.application.routes.draw do
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
    get :followings
    get :followers
    collection do
      get :mypage
    end
  end

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :favorite_users, only: [:index]
  end

  resources :notifications, only: [:index, :destroy]
  
end
