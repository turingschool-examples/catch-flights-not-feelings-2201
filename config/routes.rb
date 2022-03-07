Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  delete '/flights', to: 'flights#destroy'


#  delete '/flights', to: 'flight_passengers#destroy'
end
