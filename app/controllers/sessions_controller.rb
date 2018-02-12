class SessionsController < ApplicationController 
  before_action :set_dashboard
  #Admin Sessions
  def newadmin
    @admin = Admin.new
  end
  
  def createadmin
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])    
      session[:admin_id] = admin.id
      flash[:success] = "Sie wurden erfolgreich angemeldet"
      redirect_to admin_path
    else
      flash.now[:danger] = "Email-Adresse und/oder Password stimmen nicht überein"
      render 'newadmin'
    end
  end
  
  def destroyadmin
    session[:admin_id] = nil
    flash[:success] = "Sie sind erfolgreich abgemeldet bis zum nächsten Mal"
    redirect_to admin_login_path
  end
  
  #User Sessions
  def newuser
    @user = User.new
  end
  
  def createuser
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])    
      session[:user_id] = user.id
      flash[:success] = "Sie wurden erfolgreich angemeldet"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Email-Adresse und/oder Password stimmen nicht überein"
      render 'newuser'
    end
  end
  
  def destroyuser
    session[:user_id] = nil 
    flash[:success] = "Sie sind erfolgreich abgemeldet bis zum nächsten Mal"
    redirect_to login_path
  end
  
private
  
  def set_dashboard
    @body = 'o-page o-page--center'
    @dashboard = true
  end
  
end