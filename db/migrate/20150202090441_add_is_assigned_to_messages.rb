class AddIsAssignedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :is_assigned, :integer, :default => 0
  end
end
