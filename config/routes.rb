Rails.application.routes.draw do
  namespace :admin do
    resources :home, only: [:index]
    resources :products, only: [:index]
  end
  namespace :login do
    resources :sessionsadmin
  end
end
