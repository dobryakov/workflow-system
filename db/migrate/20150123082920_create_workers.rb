class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.integer :workpoint_id
      t.integer :user_id

      t.timestamps
    end
  end
end
