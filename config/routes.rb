Rails.application.routes.draw do
  # For details on the DSL available within this file, see

  # Mechanics
  get '/mechanics',     to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  # Parks
  get '/parks/:id',     to: 'parks#show'
end
