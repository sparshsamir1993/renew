class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.integer :service_id

      t.timestamps
    end
  end
end
