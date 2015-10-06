class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|

      t.string :type
      t.string :check_property
      t.string :check_value

    end
  end
end
