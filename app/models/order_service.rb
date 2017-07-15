class OrderService < ActiveRecord::Base
  belongs_to :order_model
  belongs_to :service

  private

  def self.create_order(service_id, user_id, model_id)
      if order = Order.create(user_id: user_id)
          orMod = order.order_models.create(order_id: order.id, model_id: model_id)

          if order.order_models.last.order_services.create(service_id: service_id, order_id: order.id)
              return order
          else
              return false
          end
      else
          return false
      end
  end

  def self.update_order(order_id, service_id, model_id)
      order = Order.find(order_id)
      @total = Service.find(service_id).price

      
  end
end
