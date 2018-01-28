class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
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
  
end
