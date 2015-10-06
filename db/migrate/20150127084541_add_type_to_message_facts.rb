class AddTypeToMessageFacts < ActiveRecord::Migration
  def change
    add_column :messagefacts, :type, :string
  end
end
