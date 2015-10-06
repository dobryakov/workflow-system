class AddBaseurlToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :base_url, :string
  end
end
