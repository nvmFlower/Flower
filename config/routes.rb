Rails.application.routes.draw do
    scope "(:locale)", locale: /en|vi/ do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
        root "pages#index"
        get "/contacts", to: "contacts#new"
        get "/carts", to: "carts#index"
        post "/cart", to: "carts#create"
        post "/carts/update", to: "carts#update"
        delete "/:id/carts", to: "carts#destroy"
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
        get "/products/:id", to: "products#show"
        post "/commet", to: "comments#create"

        resources :users
        resources :sessions
        resources :occasions, only: [:show]
        resources :kinds, only: [:show]
        resources :designs, only: [:show]
        resources :posts, only: [:index, :show]
        resources :contacts, only: [:new, :create]
        resources :products, only: [:show]
        resources :order_items
        resources :orders
        resources :searchs
        resources :comments
    end

    namespace :admin do
        resources :home, only: [:index]
        resources :products
        resources :colors
        resources :designs
        resources :occasions
        resources :kinds
        resources :categories
        resources :searchs
        resources :comments
        get "/index", to: "home#index"
    end

    namespace :login do
    resources :sessionsadmin
    end
end
