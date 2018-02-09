class ToolsController < ApplicationController
  
  def search
    @category = params[:category] 
    @body = 'bodyGarten'
    set_user
    @services = Service.where('category = ?', @category).where('show = ?', 't')
    @inquiery = Inquiery.new
  end
  
private
  def set_user
      @services = []
      @services = params[:service_ids]
    if @services 
      @plz = params[:plz].to_i
      @hws = User.all
      @users = []
      @hws.each do |user|
        @users << user if user.distance(@plz) < 200 && user.bulletproof == true && user.comparison(@services) <= 1
      end
    else
      @users = User.none
    end 
  end
end