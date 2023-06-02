Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy,]
  resources :boxers do
    resources :bookings, only: [:create, :new, :update]
  end
  resources :bookings, only: [:destroy]

  get '/dashboard', to: 'pages#dashboard'
  get '/edit_profile', to: 'pages#edit_profile'

  patch '/accept_booking/:id', to: 'bookings#accept', as: 'accept_booking'
  patch '/deny_booking/:id', to: 'bookings#deny', as: 'deny_booking'
end
