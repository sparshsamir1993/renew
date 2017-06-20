class Order < ActiveRecord::Base
  has_many :order_models
  belongs_to :user
end
