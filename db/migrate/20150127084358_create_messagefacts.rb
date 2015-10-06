class CreateMessagefacts < ActiveRecord::Migration
  def change
    create_table :messagefacts do |t|
      t.integer :message_id
      t.integer :out_id
      t.integer :workpoint_id
      t.integer :user_id

      t.timestamps
    end
  end
end
