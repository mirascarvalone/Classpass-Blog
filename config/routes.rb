Rails.application.routes.draw do
  # User creation
  resources :users, only: [:new, :create]
  get 'register' => 'users#new'

  # Logging in and out
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Posts paths
  resources :posts
end
