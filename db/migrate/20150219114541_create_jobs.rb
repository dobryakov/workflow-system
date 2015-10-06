class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :job_class

      t.timestamps
    end
  end
end
