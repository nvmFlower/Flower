class Admin::ApplicationController < ActionController::Base
  layout "layouts/admin"
  before_action :check_admin
  include SessionHelper

  private

    def check_admin
      if current_user.nil? || !current_user.is_admin
        redirect_to root_url
      end
    end
end
