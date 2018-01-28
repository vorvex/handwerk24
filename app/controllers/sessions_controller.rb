class SessionsController < ApplicationController 
  
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
  
end