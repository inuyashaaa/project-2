Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "home#index"
  get "/about", to: "home#about"
  get "/contact", to: "home#contact"

  resources :xml, only: :index

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments
    collection do
      get :autocomplete
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tags, only: :show

  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :destroy]
  end
end
