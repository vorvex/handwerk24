class Service < ApplicationRecord
  has_many :user_services 
  has_many :users, through: :user_services
  has_many :service_inquieries
  has_many :inquieries, through: :service_inquieries
  
  validates_uniqueness_of :name
  validates :category, presence: true
  
end