class Admin::UsersController < Admin::ApplicationController
  def index
    @user = User.all
  end
end
