class DashboardsController < ApplicationController
  before_action :set_user
  before_action :set_dashboard
  before_action :require_loged_in
  
  def index
    @header = @user.name
    @active = 'Index'
  end
  
  def inquieries
    @header = 'Nachrichten'
    @active = 'Inquieries'
    @inquieries = @user.inquieries.order('created_at DESC')
    if params[:inquiery_id]
      @inquiery = Inquiery.find(params[:inquiery_id]) 
    end
  end
  
  def public_inquieries
    @header = 'Öffentliche Nachrichten'
    @active = 'Public Inquieries'
    @inquieries = Inquiery.where.not(email: nil).left_joins(:users).merge(User.where(id: nil)).order('created_at DESC')
  end
  
  
  def inquiery_show
    @inquiery = Inquiery.find(params[:id])
  end
  
  def partners
    @header = 'Partner'
    @active = 'Partners'
    @partners = @user.partners
    @request = PartnerRequest.new
  end
  
  def partners_new
    @active = 'New Partners'
    @partners = User.all.where.not(id: @user.partner_ids << @user.id).search_partner(params[:name], params[:plz])
    @header = "Partnersuche"
    @request = PartnerRequest.new
  end
  
  def settings
    @active = 'Settings'
    @header = 'Einstellungen'
    @subcategories = Service_Subcategory.all.order(:service_category_id)
  end
  
  def services
    @active = 'Services'
    @header = 'Leistungen bearbeiten'
    @subcategories = Service_Subcategory.all.order(:service_category_id)
    @request = ServiceRequest.new
  end
  
  def support
    @active = 'Support'
    @header = 'Nachricht an Handwerk24'
  end
  
  def user_update
    if @user.update(user_params)
      flash[:success] = "Betrieb wurde erfolgreich aktualisiert"
      redirect_back(fallback_location: dashboard_path)
    else
      flash.now[:danger] = "Fehler"
      render 'edit'
    end
  end
  
  def password_update
    if @user.authenticate(@user.password_confirmation)
      if @user.update(user_params)
      flash[:success] = "Betrieb wurde erfolgreich aktualisiert"
      redirect_to dashboard_settings_path
      end
    else
      flash[:error] = "Passwort stimmt nicht überein"
      redirect_to dashboard_path
    end
  end
  
  def reset_password
    @body = 'o-page o-page--center'
  end
  
  def forgot_password
    @body = 'o-page o-page--center'
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
  
  def require_loged_in
    
    if session[:user_id] == nil
      flash[:danger] = "Sie können nur Ihren eigenen Akkount bearbeiten"
      redirect_to login_path
    end
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
