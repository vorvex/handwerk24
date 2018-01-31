class SearchesController < ApplicationController
  
  def gartenarbeit
    @hw = User.all
    @users = []
    @users.each do |user|
      @users << user if user.score == 1.0
    end
    @search = "false"
    @inquiery = Inquiery.new
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.category == 'Gartenarbeit'
    end
    @body = "bodyGarten"
  end
  
  def searchgarten
    
    @search = true
    @inquiery = Inquiery.new(inquiery_params)
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.category == 'Gartenarbeit'
    end
    @body = "bodyGarten"
    session[:inquiery_id] = @inquiery.id
    @ins = []
    @ins = @inquiery.service_ids
    add_score_to_user
    @hws = []
    @users.each do |u|
      @hws << u if u.score > 0.0 
    end
    render 'gartenarbeit'
  end
  
  def create
    @inquiery = Inquiery.new(inquiery_params_two)
    @services = Service.all
    if @inquiery.save
      @body = "bodyGarten"
    else 
      render 'searchgarten'
    end
  end
  
  def aussenamhaus
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.category == 'Außen am Haus'
    end
  end
  
  def hausundwohnung
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.category == 'Haus & Wohnung'
    end    
  end
  
  def bodenbelage
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.category == 'Bodenbeläge'
    end
  end
  
private
  
  def new_inquiery
    @inquiery = Inquiery.new
  end
  
  def inquiery_params
    params.require(:inquiery).permit(:plz, service_ids: [])
  end
  
  def inquiery_params_two
    params.require(:inquiery).permit(:plz, :email, :vorname, :nachname, :adresse, :stadt, :nachricht, user_ids: [], service_ids: [])
  end
    
end