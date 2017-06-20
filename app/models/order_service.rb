class OrderService < ActiveRecord::Base
  belongs_to :order_model
  belongs_to :service
end
