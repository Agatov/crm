Crm::Application.routes.draw do
  root to: 'clients#index'

  resources :clients do
    put :status, on: :member

    post :send_sms, on: :member
    post :send_weekend_sms, on: :member

    resources :comments, controller: 'comments', only: [:create, :destroy]
    resources :meetings
    resources :calls

  end

  resources :meetings
  resources :calls

  namespace :api do
    resources :clients, only: :create
  end
end
