Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#show"

  get "/register", controller: "users", to: "users#new"
  get "/register", controller: "users", to: "users#create"
  get "/dashboard", controller: "users", to: "users#show"
  get "/wishlist", controller: "users", to: "users#wishlist"
  # resources :users, only: [:new, :create, :show] do
  #   resources :wishlists, only: [:new, :create, :show, :edit, :update]
  # end

  post '/login', to: "sessions#login"
  delete '/logout', to: "sessions#logout"

	get "/auth/:provider/callback", to: "sessions#omniauth"

  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get "/dashboard", to: "users#show"

  resources :organizations, only: [:index, :show]
end
