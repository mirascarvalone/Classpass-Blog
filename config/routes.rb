Rails.application.routes.draw do
  # User creation
  resources :users, only: [:new, :create, :show]
  get 'register' => 'users#new'

  # Logging in and out
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Set index
  root 'posts#index'

  # Posts paths
  resources :posts

  # Studios paths
  resources :studios, only: [:index, :show, :new, :create]
end
