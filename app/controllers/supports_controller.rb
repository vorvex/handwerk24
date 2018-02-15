class SupportsController < ApplicationController

  def create
    @request = Support.new(support_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:success] = "Ihr Anfrage wurde gesendet"
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
    
  end
  
  def destroy
  
  end
  
private
  
  def support_params
    params.require(:support).permit(:title, :category, :body ,user_id: [])
  end
  
end
