class InquieriesController < ApplicationController
  
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
  
private  
  
  def inquiery_params
    params.require(:session).permit(:plz, service_ids: [])
  end
end