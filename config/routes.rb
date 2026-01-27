Rails.application.routes.draw do
  get "static_pages/home", to: "static_pages#home", as: :static_pages_home
  get  "users/new",    to: "users#new",    as: :users_new
  post "users/create", to: "users#create", as: :users_create

  root "static_pages#home"

  # Rotas de Autenticação (Login/Logout)
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Rotas de Usuário
  get "cadastro", to: "users#new", as: :signup

  resources :users, only: [ :create, :index, :edit, :update, :destroy ] do
    member do
      patch :make_admin
      patch :remove_admin
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
