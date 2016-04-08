Rails.application.routes.draw do

  get 'rides/new'

  get 'rides/create'

  get 'attractions/show'

  get 'attractions/new'

  get 'attractions/create'

  get 'static/home'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  post 'signout', to: 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'user_signup'

  post '/signup', to: 'users#create'

  post '/users/:id', to: 'users#reduce_tickets'


  root 'static#home'



  delete '/signout', to: 'users#destroy'

  resources :users
  resources :rides
  resources :attractions

end
