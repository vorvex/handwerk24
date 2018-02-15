class ServiceSubjectsController < ApplicationController
  before_action :set_service_subject, only: [:edit, :update, :destroy]
  before_action :require_admin 
  before_action :dashboard 
  
  def show
    @subject = Service_Subject.find(params[:id])
    @services = Service.where('service_subject_id = ?', params[:id])
    @new_service = Service.new
  end
  
  def create
    @service_subject = Service_Subject.new(service_subject_params)
    if @service_subject.save
      flash[:success] = "Leistungs Bereich wurde erfolgreich erstellt"
      redirect_back(fallback_location: service_categories_path)
    else 
      render 'new'
    end
  end

  def update 
    if @service_subject.update(service_subject_params)
      flash[:success] = "Leistungs Bereich wurde erfolgreich aktualisiert"
      redirect_back(fallback_location: service_categories_path)
    else
      render 'edit'
    end
  end

  def destroy
      @service_subject.destroy
      flash[:success] = "Leistungs Bereich wurde erfolgreich gelöscht"
      redirect_to admin_path
  end
  
  private
  
  def set_service_subject
      @service_subject = Service_Subject.find(params[:id])
    end
    def service_subject_params
      params.require(:service_subject).permit(:name, :service_subcategory_id)
  end      
  
  def require_admin
    if !current_admin
      flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
      redirect_to root_path
    end
  end
  
end