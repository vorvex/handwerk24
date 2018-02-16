class ServiceSubject < ApplicationRecord
  has_many :services
  has_many :service_subcategories
end