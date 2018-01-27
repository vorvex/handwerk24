class AdminsController < ApplicationController
  
  def index
    @users = User.all
    @fields = Field.all
    @services = Service.order(:category)
    @field = Field.new
    @service = Service.new
    @admin = Admin.new
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Ihr Akkount wurde erfolgreich erstellt"
      redirect_to admins_path
    else
      render 'new'
    end  
  end
private
    def set_admin
      @admin = Admin.find(params[:id])
    end
    def admin_params
      params.require(:user).permit(:email, :password)
    end
  
  
end