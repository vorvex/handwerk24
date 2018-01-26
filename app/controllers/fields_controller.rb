class FieldsController < ApplicationController
  before_action :set_field, only: [:edit, :show, :update, :destroy]
  
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
      redirect_to fields_url
    else
      render 'new'
    end
  end
  
  def update 
  if @field.update(field_params)
    flash[:success] = "Branche wurde erfolgreich aktualisiert"
    redirect_to fields_url
  else
    render 'edit'
  end
  end
  
 def destroy
    @field.destroy
    flash[:success] = "Branche wurde erfolgreich gelöscht"
    redirect_to fields_url
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
end