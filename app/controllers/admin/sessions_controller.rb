class Admin::SessionsController < Admin::AdminsController
  skip_before_action :require_admin_login, only: [:new, :create]
  layout false

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       if user.activated?&& user.admin?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to admin_path
      else
        message  = "Account not activated or you are not admin"
        flash[:warning] = message
        render "new"
      end

    else
      flash[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_login_path
  end
end
