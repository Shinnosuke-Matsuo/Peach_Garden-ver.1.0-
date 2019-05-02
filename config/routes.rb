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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'matchings/index'
  post '/matchings', to: 'matchings#create'

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

end
