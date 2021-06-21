Rails.application.routes.draw do
  get 'users/new'
  resources :blogs do
    resources :likes, only: [:create, :destroy] 
  end
  resources :comments
  resource :user, only: [:new, :create, :show]
  get    '/login',   to: 'users#new'
  post   '/login',   to: 'users#create'
  delete '/logout',  to: 'users#destroy'
  
  root 'users#new'

  
end
