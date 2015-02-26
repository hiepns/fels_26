class Admin::DashboardsController < Admin::AdminsController
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  def index
  end
  private

  def logged_in_admin
    unless logged_in?
      store_location
      redirect_to admin_login_url
    end
  end

end
