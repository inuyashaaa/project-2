Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users
  root to: "home#index"
  get "/about", to: "home#about"
  get "/contact", to: "home#contact"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
end
