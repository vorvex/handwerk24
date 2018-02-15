class ServiceRequestsController < ApplicationController

  def create
    @request = ServiceRequest.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:success] = "Ihr Anfrage wurde gesendet"
      redirect_to update_user_path
    else
      redirect_to update_user_path
    end
    
  end
  
  def destroy
  
  end
  
private
  
  def request_params
    params.require(:service_request).permit(:name, :message ,user_id: [])
  end
  
end
