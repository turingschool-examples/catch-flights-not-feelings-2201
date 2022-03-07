Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # resources :airlines, only: [:index]
    resources :flights, only: [:index]
    # resources :passengers, only: [:show]
    delete '/flights', to: 'passenger_flights#destroy'
  end
