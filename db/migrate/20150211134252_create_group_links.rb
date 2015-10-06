class CreateGroupLinks < ActiveRecord::Migration
  def change
    create_table :group_links do |t|

      t.references :group
      t.references :groupable, polymorphic: true

    end
  end
end
