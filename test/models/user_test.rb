require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(
      username: "beispielnutzer", 
      name: "Beispiel Nutzer", 
      inhaber: "Max Mustermann", 
      email: "max@muster.de", 
      url: "htttp://www.musterbetrieb.de",
      plz: "76275",
      stadt: "Ettlingen",
      adresse: "Hauptstraße 1",
      telefon: "0123456789",
      field_id: 1,
      password: "passwort"
      )
  end
  
  test "user should be valid" do

    assert @user.valid?

  end
  
  test "username should be present" do
    @user.username = " "
    
    assert_not @user.valid?
  end
  
  test "name should be present" do
    @user.name = " "
    
    assert_not @user.valid?
  end
  
  test "inhaber should be present" do
    @user.inhaber = " "
    
    assert_not @user.valid?
  end
  
end