Rails.application.routes.draw do

  resources :flights, only: [:index]
  resources :airlines, only: [:show]
  # get '/flights', to: 'flights#index'
  delete '/flights/:flight_id/passengers/:passenger_id', to: 'flight_passengers#destroy'
end
