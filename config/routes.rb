Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  root to: 'pets#index'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets, except: [:destroy] do
    resources :reservations, only: [:show, :new, :create, :destroy] do
      member do
        get :invoice
      end
    end
  end
  resources :reservations, only: [:index]
  get 'my_pets', to: 'pets#my_pets', as: :my_pets
end
