Rails.application.routes.draw do
  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  #maps all the conventional routes
  resources :articles do
    resources :comments
  end

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  
  delete "logout", to: "sessions#destroy"

end
