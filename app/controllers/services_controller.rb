class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :show, :update, :destroy]
  
  def index
    @services = Service.order(:category)
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
      redirect_to services_url
    else
      render 'index'
    end
  end
  
  def update 
  if @service.update(service_params)
    flash[:success] = "Leistung wurde erfolgreich aktualisiert"
    redirect_to services_url
  else
    render 'edit'
  end
  end
  
 def destroy
      @service.destroy
      flash[:success] = "Leistung wurde erfolgreich gelöscht"
      redirect_to services_url
  end
  
  private
    def set_service
      @service = Service.find(params[:id])
    end
    def service_params
      params.require(:service).permit(:name, :category)
    end
end