class ServiceCategoriesController < ApplicationController
  before_action :set_service_category, only: [:edit, :update, :destroy]
  before_action :require_admin 
  before_action :dashboard
  
  def index 
    @categories = ServiceCategory.all
    @new_category = ServiceCategory.new
  end
  
  def show
    @category = ServiceCategory.find(params[:id])
    @subcategories = ServiceSubcategory.where('service_category_id = ?', params[:id])
    @new_subcategory = ServiceSubcategory.new
  end
  
  def create
    @service_category = ServiceCategory.new(service_category_params)
    if @service_category.save
      flash[:success] = "Leistungs Unter-Kategorie wurde erfolgreich erstellt"
      redirect_to service_categories_path
    else 
      render 'new'
    end
  end

  def update 
    if @service_category.update(service_category_params)
      flash[:success] = "Leistungs Unter-Kategorie wurde erfolgreich aktualisiert"
      redirect_to service_category_path
    else
      render 'edit'
    end
  end

  def destroy
      @service_category.destroy
      flash[:success] = "Leistungs Unter-Kategorie wurde erfolgreich gelöscht"
      redirect_to admin_path
  end
  
  private
  
  def set_service_category
      @service_category = ServiceCategory.find(params[:id])
    end
    def service_category_params
      params.require(:service_category).permit(:name)
  end      
  
  def require_admin
    if !current_admin
      flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
      redirect_to root_path
    end
  end
    
end