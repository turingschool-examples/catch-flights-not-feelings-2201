Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  get '/airlines/:id', to: 'airlines#show'

  delete '/flights', to: 'flights#destroy'


#  delete '/flights', to: 'flight_passengers#destroy'
end
