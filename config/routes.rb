Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :posts
  resources :admin
  
  resources :comments, only: [:create, :index, :destroy]

  get 'home/index'
  post 'users/enable_otp'

  get 'landing/index'
  get 'feed/index'
  get 'comments/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
end
