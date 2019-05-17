Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get  'static_pages/about'

  get 'sessions/new'
  get '/signup', to:'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :profiles
  resources :microposts

  get 'matchings/index'
  post '/matchings', to: 'matchings#create'
  delete 'matchings/destroy'

  resources :messages, :only => [:create]

  mount ActionCable.server => '/cable'

end
