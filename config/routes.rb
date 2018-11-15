Rails.application.routes.draw do
  root to: 'desks#index'

  devise_for :user

  resources :users, only: [:show]

  resources :desks, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:show, :new, :create, :update]
  end
  resources :bookings, only: [:destroy]
end
