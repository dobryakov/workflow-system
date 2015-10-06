class AddJobIdToAttach < ActiveRecord::Migration
  def change
    add_column :attaches, :job_id, :integer
  end
end
