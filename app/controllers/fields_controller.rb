class FieldsController < ApplicationController
  before_action :set_field, only: [:edit, :show, :update, :destroy]
  before_action :require_admin 
  
  def index
    @fields = Field.all
    @field = Field.new
  end
  
  def new
    @field = Field.new 
  end
  
  def edit    
  end
  
  def create
    @field = Field.new(field_params)
    if @field.save
      flash[:success] = "Branche wurde erfolgreich erstellt"
      redirect_to admin_path
    else
      render 'new'
    end
  end
  
  def update 
  if @field.update(field_params)
    flash[:success] = "Branche wurde erfolgreich aktualisiert"
    redirect_to admin_path
  else
    render 'edit'
  end
  end
  
 def destroy
    @field.destroy
    flash[:success] = "Branche wurde erfolgreich gelöscht"
    redirect_to admin_path
 end
  
  def show
  end
  
  private
    def set_field
      @field = Field.find(params[:id])
    end
    def field_params
      params.require(:field).permit(:name)
    end      
  
    def require_admin
      if !current_admin
        flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
        redirect_to root_path
      end
    end
end