Rails.application.routes.draw do
  # get 'session/new'
  #  get 'session/create'
  # get 'session/destroy'
  # resources :users
  # resources :friends
  get 'home/index'
  root 'home#index'
  get 'home/about'
  # resources :articles
# all routs for the login form ----- def
resources :users
resources :sessions, only: [:new, :create, :destroy]
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
# -----end 
  # get '/new', to: 'articles#new'
  # get '/:id', to: 'articles#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
