class UsersController < ApplicationController 
  before_action :set_user, only: [:update, :destroy]
    
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
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    @user.username = @user.name.gsub(" ","-").downcase().gsub("ä","ae").gsub("ü","ue").gsub("ö","oe").gsub("ß","ss").gsub("Ö","oe").gsub("Ü","ue").gsub("Ä","ae")
    if @user.save
      flash[:success] = "Ihr Akkount wurde erfolgreich erstellt"
      redirect_to users_path
    else
      render 'new'
    end
     
  end
  
  def update
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
  end
  
  private
    def set_user
      @user = User.find_by(username: params[:username])
    end
    def user_params
      params.require(:user).permit(:username, :name, :email, :telefon, :adresse, :plz, :stadt, :url, :inhaber, :password, :field_id)
    end
end