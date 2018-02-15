class Service < ApplicationRecord
  has_many :user_services 
  has_many :users, through: :user_services
  has_many :service_inquieries
  has_many :inquieries, through: :service_inquieries
  has_and_belongs_to_many :service_categories
  has_and_belongs_to_many :service_subcategories
  has_and_belongs_to_many :service_subjects
  
  validates_uniqueness_of :name
  
end