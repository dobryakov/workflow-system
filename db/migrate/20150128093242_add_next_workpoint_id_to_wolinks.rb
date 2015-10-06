class AddNextWorkpointIdToWolinks < ActiveRecord::Migration
  def change
    add_column :wolinks, :next_workpoint_id, :integer
  end
end
