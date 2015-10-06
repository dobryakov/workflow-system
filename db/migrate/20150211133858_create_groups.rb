class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

      t.string     :title
      t.references :group_class

    end
  end
end
