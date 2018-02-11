class InquieriesController < ApplicationController
  before_action :dashboard
  before_action :require_admin 
  
  def index
    @inquieries = Inquiery.order('id DESC')
  end
  
  def new

  end
  
  def create
    @inquiery = Inquiery.new(inquiery_params)
    if @inquiery.save
      render :action => "new"
    else
      flash.now[:danger] = "Ein Fehler ist aufgetretten!"
      render :action => "new"
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def show
    @inquiery = Inquiery.find(params[:id])
    @user = current_user
    @services = @inquiery.services
  end
  
  def detach
    @inquiery = Inquiery.find(params[:id])    
    @user = User.find(params[:user_id])
    @user.inquieries.delete(@inquiery)
    redirect_to dashboard_inquieries_path
  end
  
private  
  
  def inquiery_params
    params.require(:session).permit(:plz, service_ids: [])
  end
end