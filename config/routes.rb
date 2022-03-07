Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/flights', to: 'flights#index'
  
  patch '/flights/:flight_id/:id', to: 'flights#update'
end
