Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  delete '/flights', to: 'flights#destroy'
end
