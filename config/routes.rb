
Rails.application.routes.draw do
  get 'users/new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  resources :blogs do
    resources :likes, only: [:create, :destroy] 
  end
  resources :comments
  
  resources :users
  resources :boxs
  resource :rankings, only: [:index]
  get '/ranking', to: 'rankings#index'
  root 'blogs#index'
end