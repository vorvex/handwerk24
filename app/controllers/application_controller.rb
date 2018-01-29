class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in_user?, :current_admin, :logged_in_admin?


  def current_admin
    @current_admin ||=  Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in_admin?
    !!current_admin
  end

  def require_admin
    if !logged_in_admin?
      flash[:danger] = "Diese Funktion kann nur von einem Admin ausgeführt werden"
      redirect_to root_path
    end
  end
  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_user?
    !!current_user
  end

  def require_user
    if !logged_in_user?
      flash[:danger] = "Diese Funktion kann nur von einem Partner ausgeführt werden"
      redirect_to root_path
    end
  end
  
end
