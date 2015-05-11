Myflix::Application.routes.draw do
  root 'pages#front'
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'videos#index'
  get '/register', to: 'users#new', as: 'register'
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  post '/login', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  resources :videos, only: [:show] do
    collection do
      get :search, to: "videos#search"
    end
  end
  resources :categories
  resources :users, only: [:create]
end