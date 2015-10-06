class AddWorkpointIdToOuts < ActiveRecord::Migration
  def up
    add_column    :outs, :workpoint_id, :integer
  end
  def down
    remove_column :outs, :workpoint_id
  end
end
