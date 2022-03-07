Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights do
    resources :passengers, controller: 'passenger_flights'
  end
  resources :airlines
end
