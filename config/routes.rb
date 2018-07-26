Rails.application.routes.draw do
  resources :posts
  resources :admin
  devise_for :users
  get 'landing/index'
  get 'feed/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
end
