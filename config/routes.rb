Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :flight_passengers, only: [:destroy]
end
