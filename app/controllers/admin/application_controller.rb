class Admin::ApplicationController < ActionController::Base
  layout "layouts/admin"
<<<<<<< HEAD
  include SessionHelper
=======
  before_action :check_admin
  include SessionHelper

  private

    def check_admin
      if current_user.nil? || !current_user.is_admin
        redirect_to root_url
      end
    end
>>>>>>> ff3c9a42b7c0bce21f37bd49c430f157b524d173
end
