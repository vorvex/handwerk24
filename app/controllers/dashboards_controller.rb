class DashboardsController < ApplicationController
  before_action :set_user
  before_action :set_dashboard
  def index
    
  end
  
  def inquieries
    @active = 'Inquieries'
    @inquieries = @user.inquieries
    if params[:inquiery_id]
      @inquiery = Inquiery.find(params[:inquiery_id]) 
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
  
end
