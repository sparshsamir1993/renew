class OrderModel < ActiveRecord::Base
  belongs_to :order
  belongs_to :model
  has_many :order_services
end
