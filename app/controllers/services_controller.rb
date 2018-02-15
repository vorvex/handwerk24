class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :show, :update, :destroy]
  before_action :require_admin
  before_action :dashboard  
  
  def index
    @services = Service.order(:service_category_id)
    @service = Service.new
  end
  
  def new
    @service = Service.new 
  end
  
  def edit
    
  end
  
  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = "Leistung wurde erfolgreich erstellt"
      redirect_to admin_path
    else
      render 'index'
    end
  end
  
  def update 
  if @service.update(service_params)
    flash[:success] = "Leistung wurde erfolgreich aktualisiert"
    redirect_to admin_path
  else
    render 'edit'
  end
  end
  
 def destroy
      @service.destroy
      flash[:success] = "Leistung wurde erfolgreich gelöscht"
      redirect_to admin_path
  end
  
  private
    def set_service
      @service = Service.find(params[:id])
    end
    def service_params
      params.require(:service).permit(:name, :show, :service_category_id, :service_subcategory_id, :service_subject_id)
    end
    def require_admin
      if !current_admin
        flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
        redirect_to root_path
      end
    end
end