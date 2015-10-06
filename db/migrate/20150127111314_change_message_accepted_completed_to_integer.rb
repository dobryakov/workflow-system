class ChangeMessageAcceptedCompletedToInteger < ActiveRecord::Migration
  def up
    change_column :messages, :is_accepted,  :integer, default: 0
    change_column :messages, :is_completed, :integer, default: 0
  end

  def down
  end
end
