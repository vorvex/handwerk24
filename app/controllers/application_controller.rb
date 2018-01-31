class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in_user?, :current_admin, :logged_in_admin?, :add_score_to_user, :search_true?


  def current_admin
    @current_admin ||=  Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in_admin?
    !!current_admin
  end

  def require_admin
    if !logged_in_admin?
      flash[:danger] = "Diese Funktion kann nur von einem Admin ausgeführt werden"
      redirect_to root_path
    end
  end
  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_user?
    !!current_user
  end

  def require_user
    if !logged_in_user?
      flash[:danger] = "Diese Funktion kann nur von einem Partner ausgeführt werden"
      redirect_to root_path
    end
  end
  
  def add_score_to_user
      # Algorithm for Leistungs Suche
      @users = User.all
      # Craftsman
      @users.each do |t|
        a= 0.0
        b= 0.0
        c= 0.0
        # Services
        compare = []
        compare = @ins - (t.services.ids)
        inscount = @ins.count.to_f
        count = compare.count.to_f
        factor = 0.0
        factor = (count / inscount) * 10.0
        if count == 0
          a = 10.0
        else
          a = factor
        end
        # Location
        z = 0.0
        z = (t.plz - @inquiery.plz).abs
        if z <= 10
          b = 1.0
        elsif z > 10 && z <= 100
          b = 0.9
        elsif z > 100 && z <= 200
          b = 0.4
        elsif z > 200
          b = 0
        end

        # Ratings
        c += 1.0
        t.score = a*b*c
      end 
    end  
  
  def search_true?
    if @inquiery.plz != nil
    end
  end
end
