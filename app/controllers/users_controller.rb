class UsersController < ApplicationController 
  before_action :set_user, only: [:update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
    
  def index
    if logged_in_user?
      @users = User.all
      @fields = Field.all
      @services = Service.order(:category)
      @field = Field.new
      @service = Service.new
      @admin = Admin.new
    else
      flash[:warning] = "Sie können diesen Bereich nur als Partner einsehen"
      redirect_to login_path
    end
  end
  
  def new
    @user = User.new
  end
  
  def edit
    require_same_user
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    @user.username = @user.name.gsub(" ","-").downcase().gsub("ä","ae").gsub("ü","ue").gsub("ö","oe").gsub("ß","ss").gsub("Ö","oe").gsub("Ü","ue").gsub("Ä","ae")
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
    if @user.update(user_params)
      flash[:success] = "Betrieb wurde erfolgreich aktualisiert"
      redirect_to(:back)
    else
      render 'edit'
    end
  end
  
  def page
    set_user
  end
  
  def destroy
    @user.destroy
    flash[:success] = "Branche wurde erfolgreich gelöscht"
    redirect_to(:back)
  end
  
  private
    def set_user
      @user = User.find_by(username: params[:username])
    end
    def user_params
      params.require(:user).permit(:username, :name, :email, :telefon, :adresse, :plz, :stadt, :url, :inhaber, :password, :field_id)
    end
  
    def require_same_user
      if current_user != @user && !current_admin
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
end