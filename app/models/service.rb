class Service < ApplicationRecord
  belongs_to :model
  has_many :order_services
end
