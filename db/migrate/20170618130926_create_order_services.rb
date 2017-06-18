class CreateOrderServices < ActiveRecord::Migration
  def change
    create_table :order_services do |t|
      t.integer :order_id
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
