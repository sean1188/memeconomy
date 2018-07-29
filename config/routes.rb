Rails.application.routes.draw do



  resources :posts
  resources :profiles
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :likes do 
	  member do
	    put "like", to: "likes#upvote"
	    put "dislike", to: "likes#downvote"
	  end
	end
  
  resources :admin
  
  resources :comments, only: [:create, :index, :destroy]

  get 'landing/index'
  get 'feed/index'
  get 'admin/index'
  get 'userprofile/index'
  get 'comments/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

end

