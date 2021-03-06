class UsersController < ApplicationController 
  before_action :set_user, only: [:update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :dashboard, except: [:new, :create]
 
  def index
    if logged_in_user?
      current_user_validation
      @users = User.all
      @user = current_user
      @fields = Field.all
      @services = Service.order(:category)
      @field = Field.new
      @service = Service.new
      @admin = Admin.new
      @inquieries = current_user.inquieries.order('id DESC')
      @public_inquieries = Inquiery.all.where.not('email == ""').order('id DESC')
      @possible_partners = User.all.where.not(id: @user.partner_ids << @user.id).search(params[:name])
      @partners = @user.partners
    else
      flash[:warning] = "Sie können diesen Bereich nur als Partner einsehen"
      redirect_to login_path
    end
    
  end
  
  def new
    @body = "bodyHome"
    @user = User.new
    @subcategories = ServiceSubcategory.all.order(:service_category_id)
  end
  
  def edit
    @user = User.find(params[:id])
    @subcategories = ServiceSubcategory.all.order(:service_category_id)
  end
  
  def create
    @body = "bodyHome"
    @user = User.new(user_params)
    @user.username = @user.name.gsub(" ","-").downcase().gsub("ä","ae").gsub("ü","ue").gsub("ö","oe").gsub("ß","ss").gsub("Ö","oe").gsub("Ü","ue").gsub("Ä","ae")
    if @user.password == @user.password_confirmation
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Ihr Akkount wurde erfolgreich erstellt"
        redirect_to dashboard_path
      else
        render 'new'
      end
    else
      render 'create'
    end
  end
  
  def update
    @user = User.find(params[:id])
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
    flash[:success] = " öscht"
    redirect_to :back
  end

  def services
    @user = current_user
    service_tabs    
  end
  
  def attach
    @user = current_user
    @id = @user.id
    @partner = User.find(params[:id])

    @user.partners << @partner
    @partner.partners << @user
    redirect_to dashboard_path
  end

  def detach
    @user = current_user
    @partner = User.find(params[:partner_id])

    @user.partners.delete(@partner.id)
    @partner.partners.delete(@user.id)
    redirect_to dashboard_path
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
      @user = User.find(params[:id])
      @current_user = false
      @current_user = User.find(session[:user_id]) if session[:user_id]
      if @user != @current_user && !current_admin
        flash[:danger] = "Sie können nur Ihren eigenen Akkount bearbeiten"
        redirect_to dashboard_path
      end
    end
  
    def require_admin
      if current_admin
        flash[:danger] = "Nur Administratoren können diese Funktion ausführen"
        redirect_to root_path
      end
    end
  
  def service_tabs
    @services = Service.all
  end
end