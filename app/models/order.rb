class Order < ActiveRecord::Base
  has_many :order_models
  has_many :order_services , through: :order_models
  belongs_to :user
end
