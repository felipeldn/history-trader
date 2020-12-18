Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Rails.application.routes.default_url_options[:host] = "XXX"

  root to: 'home#welcome'

  resources :users
  
  resources :posts do
    resources :comments
  end

  resources :conversations do
    resources :messages
  end

  get '/', to: 'home#welcome', as: 'welcome'
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'search', to: "posts#search"

end
