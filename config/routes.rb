Rails.application.routes.draw do
  get 'notifications/index'
  get 'notifications/destroy'
  get 'searches/search'
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "user/sessions"
  }
  
  root :to =>"homes#top"
  get 'homes/about'
  get "search" => "searches#search"
  
  resources :users, only: [:mypage,:show,:edit,:update,:destroy] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
  	  get "followers" => "relationships#followers", as: "followers"
  end
  	  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destoy]
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:index, :create, :destroy]
    
end
