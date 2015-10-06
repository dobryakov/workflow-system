class CreateOuts < ActiveRecord::Migration
  def change
    create_table :outs do |t|
      t.string  :title
      t.integer :workpoint_id
      t.integer :next_workpoint_id
      t.timestamps
    end
  end
end
