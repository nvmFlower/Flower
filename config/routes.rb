Rails.application.routes.draw do

  get "/admin", to: "admin/home#index"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  get "/logout", to: "session#new"
  delete "/logout", to: "session#destroy"
  get "/admin/designs", to: "admin/designs#index"
  get "/admin/designs", to: "admin/designs#new"
  post "/admin/designs", to: "admin/designs#create"

  root "pages#index"
  get "/occasions", to: "pages#topic"
  get "/contacts", to: "pages#contacts"
  get "/about", to: "posts#about"
  get "/details", to: "pages#details"
  get "/types", to: "pages#types"
  get "/cart", to: "pages#cart"
  get "/fashion", to: "pages#fashion"
  get "/list_post", to: "posts#index"
  get "/list_post/post", to: "posts#post"
  get "/profile", to: "users#show"
  resources :users
  resources :sessions

  namespace :admin do
    resources :home, only: [:index]
    resources :products, only: [:index]
    resources :users, only: [:index]
    resources :colors, only: [:index]
    resources :designs
  end
end
