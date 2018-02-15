class AdminsController < ApplicationController
  before_action :dashboard
  
  def index
    if logged_in_admin?       
      @users = User.all
      @services = Service.order(:service_category_id)
      @service_category = Service_Category.new
      @service_categories = Service_Category.all
      @service_subcategory = Service_Subcategory.new
      @service_subcategories = Service_Subcategory.all
      @service_subject = Service_Subject.new
      @service_subjects = Service_Subject.all
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