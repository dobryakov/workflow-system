class CreateWorkpoints < ActiveRecord::Migration
  def change
    create_table :workpoints do |t|
      t.string  :title
      t.integer :workflow_id
      t.timestamps
    end
  end
end
