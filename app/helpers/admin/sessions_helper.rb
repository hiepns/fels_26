module Admin::SessionsHelper

  def log_in user
    session[:admin_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:admin_id] = user.id
    cookies.permanent[:admin_remember_token] = user.remember_token
  end

  def current_user
    if user_id = session[:admin_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:admin_id]
      user = User.find_by id: user_id
       if user && user.authenticated?(:remember, cookies[:admin_remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end
  def forget user
    user.forget
    cookies.delete :admin_id
    cookies.delete :admin_remember_token
  end

  def log_out
    forget current_user
    session.delete :admin_id
    @current_user = nil
  end
  
  def current_user? user
    user == current_user
  end

  def redirect_back_or default
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end