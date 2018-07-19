Rails.application.routes.draw do
  
  get 'frinds/create'
  get 'frinds/update'
  get 'frinds/destroy'
  get 'friends/index'
  resources :friends
  devise_for :users
  get 'welcome/index'
  root 'friends#index'
  get 'frinds/whatever'
  #root 'frinds#whatever'

  resources :frinds, only: [:create, :update, :destroy]
end