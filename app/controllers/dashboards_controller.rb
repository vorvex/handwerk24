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
