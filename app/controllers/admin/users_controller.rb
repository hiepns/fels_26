class Admin::UsersController < Admin::AdminsController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Created success"
      redirect_to admin_users_url
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
      redirect_to admin_users_url
    else
      render "edit"
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar, :activated
  end

end
