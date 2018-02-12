class DashboardsController < ApplicationController
  before_action :set_user
  before_action :set_dashboard
  def index
    
  end
  
  def inquieries
    @header = 'Nachrichten'
    @active = 'Inquieries'
    @inquieries = @user.inquieries.order('created_at DESC')
    @inquiery = Inquiery.find(36)
    if params[:inquiery_id]
      @inquiery = Inquiery.find(params[:inquiery_id]) 
    end
  end
  
  def inquiery_show
    @inquiery = Inquiery.find(params[:id])
  end
  
  def partners
    @header = 'Partner'
    @active = 'Partners'
    @partners = @user.partners
  end
  
  def partners_new
    @active = 'New Partners'
    @partners = User.all.where.not(id: @user.partner_ids << @user.id).search_partner(params[:name], params[:plz])
    @header = "Partnersuche"
  end
  
  def settings
    @active = 'Settings'
    @header = 'Einstellungen'
    service_tabs
  end
  
    def user_update
      service_tabs
    if @user.update(user_params)
      flash[:success] = "Betrieb wurde erfolgreich aktualisiert"
      redirect_back(fallback_location: dashboard_path)
    else
      flash.now[:danger] = "Fehler"
      render 'edit'
    end
  end
  
  private
  
  def set_user
    @user = current_user
  end
  
  private
  
  def set_dashboard
    @body = 'o-page'
    @dashboard = true
  end
  
  def user_params
    params.require(:user).permit(:username, :name, :email, :telefon, :adresse, :plz, :stadt, :url, :inhaber, :password, :bulletproof, :field_id, service_ids: [])
  end
  
  def service_tabs
    @services = Service.all
    @garten , @aussen, @haus, @boden = [], [], [], []
    @services.each do |service|
      @garten << service if service.show && service.category == 'Gartenarbeit'
      @aussen << service if service.show && service.category == 'Außen am Haus'
      @haus << service if service.show && service.category == 'Haus und Wohnung'
      @boden << service if service.show && service.category == 'Bodenbeläge'
    end
  end
  
end
