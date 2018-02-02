class UsersController < ApplicationController 
  before_action :set_user, only: [:update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :dashboard
 
  def index
    if logged_in_user?
      current_user_validation
      @users = User.all
      @fields = Field.all
      @services = Service.order(:category)
      @field = Field.new
      @service = Service.new
      @admin = Admin.new
      @inquieries = current_user.inquieries
      @public_inquieries = Inquiery.all
    else
      flash[:warning] = "Sie können diesen Bereich nur als Partner einsehen"
      redirect_to login_path
    end
    
  end
  
  def new
    @user = User.new
    service_tabs
  end
  
  def edit
    @user = User.find(params[:id])
    require_same_user
    service_tabs
  end
  
  def create
    @user = User.new(user_params)
    @user.username = @user.name.gsub(" ","-").downcase().gsub("ä","ae").gsub("ü","ue").gsub("ö","oe").gsub("ß","ss").gsub("Ö","oe").gsub("Ü","ue").gsub("Ä","ae")
    service_tabs
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Ihr Akkount wurde erfolgreich erstellt"
      redirect_to dashboard_path
    else
      render 'new'
    end
     
  end
  
  def update
    require_same_user
    @user = User.find(params[:id])
    service_tabs
    if @user.update(user_params)
      flash[:success] = "Betrieb wurde erfolgreich aktualisiert"
      redirect_back(fallback_location: dashboard_path)
    else
      flash.now[:danger] = "Fehler"
      render 'edit'
    end
  end
  
  def page
    set_user
  end
  
  def destroy
    @user.destroy
    flash[:success] = "Branche wurde erfolgreich gelöscht"
    redirect_to :back
  end

  def services
    @services = current_user.services.order(:category)
  end
  
  
  private
    def set_user
      @user = User.find_by(username: params[:username])
    end
    
    def user_params
      params.require(:user).permit(:username, :name, :email, :telefon, :adresse, :plz, :stadt, :url, :inhaber, :password, :bulletproof, :field_id, service_ids: [])
    end
  
    def service_params
      params.require(:user).permit(:name, user_ids: [])
    end
  
    def require_same_user
      if params[:id] != session[:user_id]
        flash[:danger] = "Sie können nur Ihren eigenen Akkount bearbeiten"
        redirect_to root_path
      end
    end
  
    def require_admin
      if current_admin?
        flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
        redirect_to root_path
      end
    end
  
  def service_tabs
    @services = Service.all
    @garten , @aussen, @haus, @boden = [], [], [], []
    @services.each do |service|
      @garten << service if service.show && service.category == 'Gartenarbeit'
      @aussen << service if service.show && service.category == 'Außen am Haus'
      @haus << service if service.show && service.category == 'Haus und Wohnung'
      @boden << service if service.show && service.category == 'Bodenbeläge'
    end
  end
end