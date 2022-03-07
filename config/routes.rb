Rails.application.routes.draw do
  resources :flights do
    resources :passengers, controller: 'flight_passengers'
  end

  resources :airlines 
end
