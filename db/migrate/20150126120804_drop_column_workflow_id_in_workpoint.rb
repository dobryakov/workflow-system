class DropColumnWorkflowIdInWorkpoint < ActiveRecord::Migration
  def up
    remove_column :workpoints, :workflow_id
  end
  def down
    add_column    :workpoints, :workflow_id, :integer
  end
end
