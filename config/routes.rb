Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users
  root to: "home#index"
  get "/about", to: "home#about"
  get "/contact", to: "home#contact"

  resources :users, only: [:index, :destroy]
  resources :posts do
    resources :comments
  end
end
