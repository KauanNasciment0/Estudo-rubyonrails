Rails.application.routes.draw do
  root "static_pages#home"

  # Rotas de Autenticação (Login/Logout)
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Rotas de Usuário
  get 'cadastro', to: 'users#new', as: :signup

  # Aqui está o segredo: Adicionamos o :index na lista!
  # Isso cria automaticamente o GET /users apontando para users#index
  resources :users, only: [:create, :index]

  # Saúde do sistema
  get "up" => "rails/health#show", as: :rails_health_check
end