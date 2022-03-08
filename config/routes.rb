Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/flights', to: 'flights#index'
  get '/airlines/:id', to: 'airlines#show'
  delete '/passenger_flights/:passenger_id/:flight_id', to: 'passenger_flights#destroy'
end
