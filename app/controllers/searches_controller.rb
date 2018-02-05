class SearchesController < ApplicationController
  
  def gartenarbeit
    @category = "Gartenarbeit"
    @body = "bodyGarten"
    search
  end
  
  def searchgarten
    @category = "Gartenarbeit"
    @body = "bodyGarten"
    create_search
    render 'gartenarbeit'
  end
  
  def aussen
    @category = "Außen am Haus"
    @body = "bodyGarten"
    search
  end
  
  def searchaussen
    @category = "Außen am Haus"
    @body = "bodyGarten"
    create_search
    render 'aussen'
  end
  
  def hauswohnung
    @category = "Haus und Wohnung"
    @body = "bodyGarten"
    search
  end

  def searchhaus
    @category = "Haus und Wohnung"
    @body = "bodyGarten"
    create_search
    render 'hauswohnung'
  end  

  def bodenbelag
    @category = "Bodenbeläge"
    @body = "bodyGarten"
    search
  end
  
  def searchboden
    @category = "Bodenbeläge"
    @body = "bodyGarten"
    create_search
    render 'bodenbelag'
  end  
  
  def create
    @inquiery = Inquiery.new(inquiery_params_two)
    @services = Service.all
    if @inquiery.save
      @body = "bodyHome"
      @overlay = "Vielen Dank! Ihre Nachricht wurde an die ausgewählten Handwerker weitergeleitet."
    else 
      render 'searchgarten'
    end
  end 
  
private
  
  def search
    @users = User.all
    @hws = []
    @users.each do |user|
      user.score = 0.0
      @hws << user if user.score == 1.0
    end
    @search = false
    @inquiery = Inquiery.new
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.show && service.category == @category
    end
    @results = User.order(:score)
  end
  
  def create_search
    @search = true
    @inquiery = Inquiery.new(inquiery_params)
    @services = Service.all
    @leistung = []
    @services.each do |service|
      @leistung << service if service.show && service.category == @category
    end
    session[:inquiery_id] = @inquiery.id
    @ins = []
    @ins = @inquiery.service_ids
    add_score_to_user
    @hws = []
    @users.each do |u|
      @hws << u if u.score >= 0.01 
    end
  end
  
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