class Service < ApplicationRecord
  has_many :user_services 
  has_many :users, through: :user_services
  has_many :service_inquieries
  has_many :inquieries, through: :service_inquieries
  belongs_to :service_categories
  belongs_to :service_subcategories
  belongs_to :service_subject
  
  validates_uniqueness_of :name
  
end