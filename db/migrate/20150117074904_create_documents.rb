class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|

      t.string :type

    end
  end
end
