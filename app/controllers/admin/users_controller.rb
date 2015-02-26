class Admin::UsersController < Admin::AdminsController
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      UserMailer.account_activation(@user).deliver
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def show
    @user = User.find params[:id]

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  def logged_in_admin
    unless logged_in? || current_user.admin?
      store_location
      flash[:danger] = "You aren't admin or not loged in"
      redirect_to admin_login_url
    end
  end

end
