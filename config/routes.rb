Rails.application.routes.draw do
  root to: 'desks#index'

  devise_for :user

  resources :users, only: [:show]

  resources :desks, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:destroy]
end
