Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  delete '/flights/:flight_id/passengers/:passenger_id', to: 'flight_passengers#destroy'

  get '/airlines/:id', to: 'airlines#show'
end
