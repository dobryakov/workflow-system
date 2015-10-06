class UpdateMessageAcceptedCompleted < ActiveRecord::Migration
  def self.up
    rename_column :messages, :accepted,  :is_accepted
    rename_column :messages, :completed, :is_completed
  end

  def self.down
    rename_column :messages, :is_accepted,  :accepted
    rename_column :messages, :is_completed, :completed
  end
end
