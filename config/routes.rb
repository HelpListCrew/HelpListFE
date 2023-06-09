Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#show"
  resources :wishlist_items, only: [:index, :create, :update, :destroy]
  resources :organizations, only: [:index, :show] do
    resources :users, only: [:show], module: :organizations
  end

  get "/register", controller: "users", to: "users#new"
  post "/register", to: "users#create"
 
  get "/dashboard", controller: "users", to: "users#show"
  
  post '/login', to: "sessions#login"
  delete '/logout', to: "sessions#logout"

	post '/kroger/add_to_cart'


  get "/search", controller: "search", to: "search#index"
  
	get "/auth/:provider/callback", to: "sessions#omniauth"
end
