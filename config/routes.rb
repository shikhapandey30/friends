Rails.application.routes.draw do
  
  get 'frinds/create'
  get 'frinds/update'
  get 'frinds/destroy'
  get 'friends/index'
  resources :friends
  devise_for :users
  get 'welcome/index'
  root 'frinds#welcome'
  get "frinds/myfriend"
  resources :users
  

  #root 'frinds#whatever'

  resources :frinds, only: [:create, :update, :destroy]
  get 'frinds/whatever'
   #get 'auth/:provider/callback', to: 'sessions#create'
   match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
   match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end