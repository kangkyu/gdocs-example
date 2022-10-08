Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resource :session, only: [:new]
  get '/auth/google_oauth2/callback', to: "sessions#auth"
end
