class Admin::AdminsController < ActionController::Base
  protect_from_forgery with: :exception
  include Admin::SessionsHelper
  layout "admin/admin"
  before_action :require_admin_login

  private
  def require_admin_login
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to admin_login_url
    end
  end
end
