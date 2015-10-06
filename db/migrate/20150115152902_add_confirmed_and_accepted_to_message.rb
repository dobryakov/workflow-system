class AddConfirmedAndAcceptedToMessage < ActiveRecord::Migration
  def up
    add_column    :messages, :completed, :boolean, default: false
    add_column    :messages, :accepted,  :boolean, default: false
  end
  def down
    remove_column :messages, :completed
    remove_column :messages, :accepted
  end
end
