class UsersWorkpoints < ActiveRecord::Migration
  def up

    create_table :users_workpoints, id: false do |t|
      t.belongs_to :user
      t.belongs_to :workpoint
    end

  end
  def down

    drop_table :users_workpoints

  end

end
