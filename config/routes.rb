Rails.application.routes.draw do
  namespace :admin do
    resources :colors
  end
end
