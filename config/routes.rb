Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#show"

  resource :session, only: [:new]
  get '/auth/google_oauth2/callback', to: "sessions#create"
end
