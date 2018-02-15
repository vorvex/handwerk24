class Service_Subject < ApplicationRecord
  has_many :services
  has_many :service_subcategories
end