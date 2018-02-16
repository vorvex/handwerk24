class Service < ApplicationRecord
  has_many :user_services 
  has_many :users, through: :user_services
  has_many :service_inquieries
  has_many :inquieries, through: :service_inquieries
  belongs_to :service_category
  belongs_to :service_subcategory
  belongs_to :service_subject
end