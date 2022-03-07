Rails.application.routes.draw do
  resources :flights, only: :index
  delete '/flights/:id/passengers', to: 'passenger_flights#destroy'
end
