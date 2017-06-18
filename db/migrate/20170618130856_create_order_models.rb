class CreateOrderModels < ActiveRecord::Migration
  def change
    create_table :order_models do |t|
      t.integer :order_id
      t.integer :model_id

      t.timestamps null: false
    end
  end
end
