class UserinterfacesController < ApplicationController
  
  def index
    @body = "bodyHome"
    @overlay = "Finden Sie kostenlos und schnell den richtigen Handwerker für Ihre Aufgabe!"
    @categories = ServiceCategory.all
  end
  
end