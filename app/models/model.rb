class Model < ActiveRecord::Base
  belongs_to :brand
  has_many :services
  has_many :order_models
end
