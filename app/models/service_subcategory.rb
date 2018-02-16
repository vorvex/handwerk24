class ServiceSubcategory < ApplicationRecord
  has_many :services
  has_many :service_categories
end