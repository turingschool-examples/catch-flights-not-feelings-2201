Rails.application.routes.draw do

  resources :flights, only: [:index]
  resources :airlines, only: [:show]

  delete '/flights/:flight_id/passengers/:passenger_id', to: 'flight_passengers#destroy'
end
