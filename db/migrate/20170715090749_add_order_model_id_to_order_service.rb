class AddOrderModelIdToOrderService < ActiveRecord::Migration
  def change
    add_column :order_services, :order_model_id, :integer
  end
end
