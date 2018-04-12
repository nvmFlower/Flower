Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
  get "login", to: "session#new"

  namespace :admin do
    resources :home, only: [:index]
    resources :products, only: [:index]
  end
  namespace :login do
    resources :sessionsadmin
  end
end
