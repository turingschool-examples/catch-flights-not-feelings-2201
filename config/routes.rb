Rails.application.routes.draw do
  resources :flights, only: [:index]

  resources :passenger_flights, only: [:destroy]

  resources :airlines, only: [:show]
end
