class CreateGroupClasses < ActiveRecord::Migration
  def change
    create_table :group_classes do |t|

      t.string :title

    end
  end
end
