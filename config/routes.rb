Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :airlines, only: [:show]
  resources :flights, only: [:index] do
    resources :passengers, only: [:destroy], controller: 'passenger_flights'
  end

end
