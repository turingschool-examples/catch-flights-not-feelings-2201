Rails.application.routes.draw do

  resources :flights, only:[:index]
  # get '/flights', to: 'flights#index'
  delete '/flights/:flight_id/passengers/:passenger_id', to: 'flight_passengers#destroy'
end
