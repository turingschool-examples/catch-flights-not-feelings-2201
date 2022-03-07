Rails.application.routes.draw do
# get '/flights', to: 'flights#index'
# post '/flights', to: 'flights#index'
delete '/flights', to: 'flights#delete'
resources :flights, only:[:index, :delete]
resources :airlines, only:[:show]
end
