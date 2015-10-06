class CreateWowolinks < ActiveRecord::Migration
  def change
    create_table :wowolinks do |t|
      t.integer :workflow_id
      t.integer :workpoint_id

      t.timestamps
    end
  end
end
