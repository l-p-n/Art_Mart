Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :artworks do
    resources :bookings, only: [:create]
  end
  resources :users, only: [:show]

  resources :bookings, only: [:show]

  get "pages/about", to: 'pages#about'

  post "bookings/:id/approve", to: 'bookings#approve', as: 'approve_booking'
  post "bookings/:id/decline", to: 'bookings#decline', as: 'decline_booking'
end
