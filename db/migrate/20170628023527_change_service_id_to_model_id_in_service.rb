class ChangeServiceIdToModelIdInService < ActiveRecord::Migration
  def self.up
      rename_column :services, :service_id, :model_id
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
end
