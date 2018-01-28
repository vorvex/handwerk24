class AdminsController < ApplicationController
  
  def index
    if logged_in_admin?       
      @users = User.all
      @fields = Field.all
      @services = Service.order(:category)
      @field = Field.new
      @service = Service.new
      @admin = Admin.new
    else
      flash[:warning] = "Bitte Anmelden"
      redirect_to admin_login_path
    end
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Ihr Akkount wurde erfolgreich erstellt"
      redirect_to admin_path
    else
      render 'root'
    end  
  end
  
private
    def set_admin
      @admin = Admin.find(params[:id])
    end
    def admin_params
      params.require(:admin).permit(:email, :password)
    end
  
  
end