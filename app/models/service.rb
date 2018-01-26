class Service < ApplicationRecord
  has_many :user
  validates :category, presence: true
end