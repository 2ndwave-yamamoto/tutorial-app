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

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'blogs#index'
  root 'users#new'

  
end
