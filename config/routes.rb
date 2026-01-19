Rails.application.routes.draw do
  root "static_pages#home"
  get "users/new"
  get "users/create"

  get 'cadastro', to: 'users#new', as: :signup
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:new, :create]

end
