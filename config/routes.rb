Rails.application.routes.draw do
  
  resources :categories
  get 'frinds/create'
  get 'frinds/update'
  get 'frinds/destroy'
  get 'friends/index'
  resources :friends
  devise_for :users
  get 'welcome/index'
  root 'frinds#welcome'
  get "frinds/myfriend"
  get "frinds/myprofile"
  get "frinds/pending"
  resources :users
  get 'layouts/application'
  

  #root 'frinds#whatever'

  resources :frinds, only: [:create, :update, :destroy]
  get 'frinds/whatever'

  resources :posts

  resources :posts do
    resources :comments do
      resources :replies
    end  
  end

   #get 'auth/:provider/callback', to: 'sessions#create'
   match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
   match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
   post '/likes' => 'likes#create', as: :like_create
   post '/dislikes' => 'likes#dislike', as: :dislike_create
end