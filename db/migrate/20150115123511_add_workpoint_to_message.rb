class AddWorkpointToMessage < ActiveRecord::Migration
  def up
    add_column    :messages, :sender_out_id,          :integer
    add_column    :messages, :sender_workpoint_id,    :integer
    add_column    :messages, :recipient_workpoint_id, :integer
  end
  def down
    remove_column :messages, :sender_out_id
    remove_column :messages, :sender_workpoint_id
    remove_column :messages, :recipient_workpoint_id
  end
end
