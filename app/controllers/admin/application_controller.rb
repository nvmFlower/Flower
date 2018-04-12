class Admin::ApplicationController < ActionController::Base
  layout "layouts/admin"
  include SessionHelper
end
