class UsersController < ApplicationController 
  
  def index
    @users = User.all
    @fields = Field.all
  end
  
  def new
    @user = User.new
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
  
  def page
    set_user
  end
  
  private
    def set_user
      @user = User.find_by(username: params[:username])
    end
    def user_params
      params.require(:user).permit(:username, :name, :email, :telefon, :adresse, :plz, :stadt, :url, :inhaber, :password, :field_id)
    end
end