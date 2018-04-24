class SessionController < LoginController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.is_admin?
        login_url user
          if params[:session][:remember_me] == Settings.remember_me
            remember user
          else
            forget user
          end
        redirect_to admin_url
      else
        redirect_to root_url
      end
    else
      flash.now[:danger] = t "danger"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
