Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/flights", to: 'flights#index'
  resources :flights, only: [:index] do
    # resources :passengers
  end

  delete "/flights/:id/passengers/:passenger_id", to: 'passenger_flights#delete'
  get 'airlines/:id', to: 'airlines#show'
end
