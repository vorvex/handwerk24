class PersonalizationsController < ApplicationController

  def create
      @newpersonalize = Personalization.new(personalization_params)
      @newpersonalize.user_id = current_user.id
      if @newpersonalize.save
        flash[:success] = "Ihre Einstellungen wurden übernommen"
        redirect_to dashboard_path
      else
        redirect_to dashboard_path
      end
  end
  
  def update
    @editpersonalize = current_user.personalizations.first
    if @editpersonalize.update(personalization_params)
      flash[:success] = "Ihre Einstellungen wurden übernommen"
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end
  
private
  
  def personalization_params
    params.require(:perzonalization).permit(:color_primary, :first_entry_a, :main_entry_a ,user_id: [])
  end
    
end