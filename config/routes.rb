Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "pages#index"
    get "/contacts", to: "contacts#new"
    get "/details", to: "products#show"
    get "/cart", to: "carts#index"
    get "/profile", to: "users#show"
    get "/admin", to: "admin/home#index"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "session#new"
    post "/login", to: "session#create"
    get "/logout", to: "session#new"
    delete "/logout", to: "session#destroy"
    get "/list_post", to: "posts#index"
    get "/about", to: "posts#about"
    get "/profile", to: "users#show"

    resources :users
    resources :sessions
    resources :occasions, only: [:show]
    resources :types, only: [:show]
    resources :designs, only: [:show]
    resources :posts, only: [:index, :show]
    resources :contacts, only: [:new, :create]
    resources :products, only: [:show]

  namespace :admin do
    resources :home, only: [:index]
    resources :products, only: [:index]
    resources :colors
    resources :designs
    resources :occasions
    resources :type_flowers
    get "/index", to: "home#index"
  end

  namespace :login do
    resources :sessionsadmin
  end
end
end
