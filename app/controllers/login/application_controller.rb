class Login::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "login"
end
