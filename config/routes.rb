Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :users, only: [:new, :create]
  resources :boxers, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:create] do
      patch :confirm, on: :member
    end
  end

  get '/dashboard', to: 'pages#dashboard'
end
