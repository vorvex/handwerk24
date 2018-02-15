class PartnerRequestsController < ApplicationController

  def create
    @request = PartnerRequest.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:success] = "Ihr Anfrage wurde gesendet"
      redirect_to dashboard_partners_path
    else
      redirect_to dashboard_path
    end
    
  end
  
  def destroy
  
  end
  
private
  
  def request_params
    params.require(:partner_request).permit(:name, :email ,user_id: [])
  end
  
end
