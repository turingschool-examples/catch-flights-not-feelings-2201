Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/flights', to: 'flights#index'
delete '/passengers/:id/flights', to: 'passenger_flights#destroy'
get '/airlines/:id', to: 'airlines#show'
end
