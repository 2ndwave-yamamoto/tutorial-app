
Rails.application.routes.draw do
  get 'users/new'
  resources :blogs do
    resources :likes, only: [:create, :destroy] 
  end
  resources :comments
  
  resource :user, only: [:new, :create, :show, :index, :registration]
  get    '/login',   to: 'users#new'
  post   '/login',   to: 'users#create'
  delete '/logout',  to: 'users#destroy'
  get '/signup', to: 'users#index'
  post '/signup', to: 'users#registration'

  resource :rankings, only: [:index]
  get '/ranking', to: 'rankings#index'
  root 'blogs#index'
end