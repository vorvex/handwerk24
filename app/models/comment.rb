class Comment < ApplicationRecord
  
  #has_many :users
  before_save { self.email = email.downcase }
  
  validates :name, presence: true  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :adresse, presence: true
  validates :plz, presence: true
  validates :stadt, presence: true
  
end