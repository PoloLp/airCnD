Rails.application.routes.draw do
  # root to: 'pages#home'

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  resources :desks, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
end
