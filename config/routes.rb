Rails.application.routes.draw do
  resources :posts
  resources :admin
  
  resources :comments, only: [:create, :index, :destroy]
  devise_for :users

  get 'landing/index'
  get 'feed/index'
  get 'comments/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
end
