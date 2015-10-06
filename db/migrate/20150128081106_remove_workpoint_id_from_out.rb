class RemoveWorkpointIdFromOut < ActiveRecord::Migration
  def up
    remove_column :outs, :workpoint_id
  end
  def down
    add_column    :outs, :workpoint_id, :integer
  end
end
