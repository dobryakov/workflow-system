class AddFullUrlToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :full_url, :text
  end
end
