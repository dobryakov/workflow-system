class AddForeignIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :foreign_id, :integer
  end
end
