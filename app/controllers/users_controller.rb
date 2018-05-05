class UsersController < ApplicationController
  def show
<<<<<<< HEAD
   @user = User.find_by id: params[:id]
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
=======
   @order = Order.where user_id: current_user.id

>>>>>>> ff3c9a42b7c0bce21f37bd49c430f157b524d173
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
