class User < ApplicationRecord
  has_and_belongs_to_many(:partners, class_name: 'User',
                          join_table: 'partners',
                          foreign_key: 'company_a_id',
                          association_foreign_key: 'company_b_id')
  
  has_secure_password  
  has_and_belongs_to_many :fields
  has_many :user_services
  has_many :services, through: :user_services
  has_many :user_inquieries
  has_many :inquieries, through: :user_inquieries
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }  
  validates :inhaber, presence: true, length: { minimum: 3, maximum: 25 }  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }  
  #VALID_URL_REGEX = /^((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix  
  validates :url, presence: true, length: { maximum: 105 }
  validates :plz, presence: true, length: { minimum: 5, maximum: 5 }    
  validates :stadt, presence: true
  validates :adresse, presence: true
  validates :telefon, presence: true
  
  def connected_partners
    self.partners.order('id ASC')
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      none
    end
  end
  
end