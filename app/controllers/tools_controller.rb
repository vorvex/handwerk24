class ToolsController < ApplicationController
  
  def search
    @category = 2
    @category = params[:category] 
    @category = 2 if @category.nil?
    @selected_services = []
    @selected_services = params[:service_ids]
    @body = 'bodyGarten'
    set_user
    @services = Service.where('service_subcategory_id = ?', @category).where('show = ?', 't')
    @inquiery = Inquiery.new
    @inquiery.service_ids = @selected_services
  end
  
  def create
    @services = Service.all
    @inquiery = Inquiery.new(inquiery_params)
    if @inquiery.save
      @body = "bodyHome"
      @overlay = "Vielen Dank! Ihre Nachricht wurde an die ausgewählten Handwerker weitergeleitet."
    else 
      render 'create'
    end
  end
  
private
  def set_user
    if @selected_services 
      @selected_services.map!(&:to_i)
      @plz = params[:plz].to_i
      @topplz = @plz + 200
      @bottomplz = @plz - 200 
      @all_user = User.all.sort_by {|user| user.comparison(@selected_services) }
      @users = []
      @all_user.each do |user|
        @users << user if user.distance(@plz) < 200 && user.comparison(@selected_services) <= 1
      end
    else
     @users = User.none 
    end
    end
    
    def inquiery_params
      params.require(:inquiery).permit(:plz, :email, :vorname, :nachname, :adresse, :stadt, :nachricht, user_ids: [], service_ids: [])
    end

end