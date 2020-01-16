Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :home
  resources :users
  
  resources :posts do
    resources :comments
  end

  get '/', to: 'home#welcome', as: 'welcome'
  get '/feed', to: 'home#feed', as: 'feed'
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

end
