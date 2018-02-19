class DashboardsController < ApplicationController
  before_action :set_user
  before_action :set_dashboard
  before_action :require_loged_in
  
  def index
    @header = @user.name
    @active = 'Index'
    if @user.personalizations.any?
      @updatepersonalize = @user.personalizations.first
    else
      @newpersonalize = Personalization.new
    end
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
    @all_inquieries = Inquiery.where.not(email: "").left_joins(:users).merge(User.where(id: nil)).order('created_at DESC')
    @inquieries = []
    @all_inquieries.each do |inquiery|
      @inquieries << inquiery if inquiery.distance(@user.plz) < 300 
    end
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
    @subcategories = ServiceSubcategory.all.order(:service_category_id)
  end
  
  def services
    @active = 'Services'
    @header = 'Leistungen bearbeiten'
    @subcategories = ServiceSubcategory.all.order(:service_category_id)
    @request = ServiceRequest.new
  end
  
  def support
    @active = 'Support'
    @header = 'Nachricht an Handwerk24'
    @support = Support.new
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
    if @user.password == @user.password_confirmation
      if @user.update(user_params)
      flash[:success] = "Betrieb wurde erfolgreich aktualisiert"
      redirect_to dashboard_settings_path
      end
    else
      flash[:danger] = "Altes Passwort ist nicht korrekt"
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
  

  
  
end
