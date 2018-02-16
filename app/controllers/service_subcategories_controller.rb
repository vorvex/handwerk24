class ServiceSubcategoriesController < ApplicationController
  before_action :set_service_subcategory, only: [:edit, :update, :destroy]
  before_action :require_admin 
  before_action :dashboard
  
  def show
    @subcategory = ServiceSubcategory.find(params[:id])
    @subjects = ServiceSubject.where('service_subcategory_id = ?', params[:id])
    @new_subject = ServiceSubject.new
  end
  
  def create
    @service_subcategory = ServiceSubcategory.new(service_subcategory_params)
    if @service_subcategory.save
      flash[:success] = "Leistungs Unter-Kategorie wurde erfolgreich erstellt"
      redirect_back(fallback_location: service_categories_path)
    else 
      render 'new'
    end
  end

  def update 
    if @service_subcategory.update(service_subcategory_params)
      flash[:success] = "Leistungs Unter-Kategorie wurde erfolgreich aktualisiert"
      redirect_back(fallback_location: service_categories_path)
    else
      render 'edit'
    end
  end

  def destroy
      @service_subcategory.destroy
      flash[:success] = "Leistungs Unter-Kategorie wurde erfolgreich gelöscht"
      redirect_to admin_path
  end
  
  private
  
  def set_service_subcategory
      @service_subcategory = ServiceSubcategory.find(params[:id])
    end
    def service_subcategory_params
      params.require(:service_subcategory).permit(:name, :service_category_id)
  end      
  
  def require_admin
    if !current_admin
      flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
      redirect_to root_path
    end
  end
    
end