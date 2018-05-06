class UsersController < ApplicationController
  def show
   @order = Order.where user_id: current_user.id

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :address, :email, :phone, :password,
      :password_confirmation
  end

end
