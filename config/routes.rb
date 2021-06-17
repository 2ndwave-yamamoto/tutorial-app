Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  resources :blogs
  resources :comments
  
  resource :user, only: [:new, :create, :show]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'blogs#index'
  root 'sessions#new'

  
end
