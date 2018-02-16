class AdminsController < ApplicationController
  before_action :dashboard
  
  def index
    if logged_in_admin?       
      @users = User.all
      @services = Service.order(:service_category_id)
      @service_category = ServiceCategory.new
      @service_categories = ServiceCategory.all
      @service_subcategory = ServiceSubcategory.new
      @service_subcategories = ServiceSubcategory.all
      @service_subject = ServiceSubject.new
      @service_subjects = ServiceSubject.all
      @field = Field.new
      @fields = Field.all
      @service = Service.new
      @admin = Admin.new
      @body = "bodyDash"
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