Myflix::Application.routes.draw do
  root 'pages#front'
  get '/home', to: 'videos#index'


  resources :videos, only: [:show] do
    collection do
      get :search, to: "videos#search"
    end
    resources :reviews, only: [:create]
  end

  get 'my_queue', to: 'queue_items#index'

  get 'ui(/:action)', controller: 'ui'
  
  get '/register', to: 'users#new', as: 'register'
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  post '/login', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  
  
  resources :categories
  resources :queue_items, only: [:create, :destroy]
  post 'update_queue', to: 'queue_items#update_queue'
  resources :users, only: [:create, :show]
  get 'people', to: 'relationships#index'
  resources :relationships, only: [:create, :destroy]

  get 'forgot_password', to: 'forgot_passwords#new'
  resources :forgot_passwords, only: [:create]

  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'

  resources :password_resets, only: [:show, :create]
  get 'expired_token', to: 'password_resets#expired_token'


end