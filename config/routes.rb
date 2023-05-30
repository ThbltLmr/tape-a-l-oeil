Rails.application.routes.draw do
  devise_for :users
  resources :boxers
  root to: "pages#home"
end
