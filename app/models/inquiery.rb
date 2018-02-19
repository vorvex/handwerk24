class Inquiery < ApplicationRecord
  has_many :user_inquieries
  has_many :users, through: :user_inquieries 
  has_many :service_inquieries
  has_many :services, through: :service_inquieries
  #before_save { self.email = email.downcase }
  #validates :nachname, presence: true  
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  #validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  #validates :adresse, presence: true
  #validates :plz, presence: true
  #validates :stadt, presence: true
  
  def distance(plz)  
    (self.plz - plz).abs
  end
  
end