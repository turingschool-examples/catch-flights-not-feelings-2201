Rails.application.routes.draw do
  resources :flights, only: [:index, :destroy]
end
