class AddTitleToFilter < ActiveRecord::Migration
  def change
    add_column :filters, :title, :string
  end
end
