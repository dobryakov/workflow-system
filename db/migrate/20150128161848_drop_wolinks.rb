class DropWolinks < ActiveRecord::Migration
  def up
    drop_table   :wolinks
  end
  def down
    create_table :wolinks do |t|
      t.integer  :out_id
      t.integer  :workpoint_id
      t.integer  :next_workpoint_id
      t.timestamps
    end
  end
end
