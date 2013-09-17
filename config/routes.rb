Crm::Application.routes.draw do
  root to: 'clients#index'

  resources :clients do
    put :status, on: :member

    resources :comments, controller: 'comments', only: [:create, :destroy]
    resources :deliveries
  end

  namespace :api do
    resources :clients, only: :create
  end
end
