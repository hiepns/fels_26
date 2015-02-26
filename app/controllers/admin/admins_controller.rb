class Admin::AdminsController < ActionController::Base
  protect_from_forgery with: :exception
  include Admin::SessionsHelper
  layout "admin/admin"

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
