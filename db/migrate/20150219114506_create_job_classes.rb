class CreateJobClasses < ActiveRecord::Migration
  def change
    create_table :job_classes do |t|
      t.string :title

      t.timestamps
    end
  end
end
