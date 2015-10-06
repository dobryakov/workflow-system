class FiltersOuts < ActiveRecord::Migration
  def change

    create_table :filters_outs, id: false do |t|
      t.belongs_to :filter
      t.belongs_to :out
    end

  end
end
