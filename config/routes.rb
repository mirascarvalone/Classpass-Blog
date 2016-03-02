Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
