class User < ApplicationRecord
  has_and_belongs_to_many(:partners, class_name: 'User',
                          join_table: 'partners',
                          foreign_key: 'company_a_id',
                          association_foreign_key: 'company_b_id')
  
  has_secure_password  
  has_and_belongs_to_many :fields
  has_many :partner_requests
  has_many :user_services
  has_many :services, through: :user_services
  has_many :user_inquieries
  has_many :personalizations
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

  def self.search_partner(name, plz)
    if name || plz
      where('name LIKE ?', "%#{name}%").where('plz LIKE ?', "%#{plz}%")
    else
      all
    end
  end
  
  def self.search(search, top, bottom)
    if search
      where('plz BETWEEN ? AND ?', bottom, top).left_joins(:services).merge(Service.where(id: search)).uniq
    else
      none
    end
  end
    
  def distance(plz)  
    (self.plz - plz).abs
  end
  
  def comparison(services)
    (services - self.services.ids).count
  end
  
  def unavailable(services)
    (services - self.services.ids)
  end
  
  def initials
    first_name = self.name.split.first[0]
    second_name = self.name.split.second[0]
    f = first_name.split[0]
    s = second_name.split[0]
    initials = (f+s).downcase
    return initials
  end
  
end