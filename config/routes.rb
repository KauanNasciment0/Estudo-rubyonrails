Rails.application.routes.draw do
  root "static_pages#home"

  # Rotas de Autenticação (Login/Logout)
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Rotas de Usuário
  get 'cadastro', to: 'users#new', as: :signup

  resources :users, only: [:create, :index, :edit, :update] do
    member do
      patch :make_admin
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end