Rails.application.routes.draw do
  resources :flights, only: [:index, :destroy]
  resources :airlines, only: [:show]
end
