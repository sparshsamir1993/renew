class OrderService < ActiveRecord::Base
  belongs_to :order_model
  belongs_to :service

  private

  def self.create_order(service_id, model_id, user_id)
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
      if order
          if order.order_models.where(model_id: model_id).present?
              if order.order_models.where(model_id: model_id).first.order_services.where(service_id: service_id).present?
                  return order
              else
                  if order.order_models.where(model_id: model_id).first.order_services.create(service_id: service_id, order_id: order.id)
                      return order
                  else
                      return false
                  end
              end


          else
              order.order_models.create(order_id: order_id, model_id: model_id)

              if order.order_models.where(model_id: model_id).first.order_services.create(service_id: service_id, order_id: order_id)
                  return order
              else
                  return false
              end
          end
      else

      end
  end

   def self.destroy_service(order_id, model_id, service_id)
       if Order.find(order_id).order_models.where(model_id: model_id).first.order_services.where(service_id: service_id).first.destroy
           return Order.find(order_id).order_services
       else
           return false
       end
   end







end
