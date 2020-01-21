Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  Rails.application.routes.default_url_options[:host] = "XXX"

  root to: 'home#welcome'

  resources :users
  resources :home
  
  resources :posts do
    resources :comments
  end

  resources :conversations do
    resources :messages
  end

  get '/', to: 'home#welcome', as: 'welcome'
  get '/feed', to: 'home#feed', as: 'feed'
  get '/myprofile', to: 'users#show', as: 'myprofile'
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

end
