class DropUsersWorkpoints < ActiveRecord::Migration

    def up

      drop_table :users_workpoints

    end

    def down

      create_table :users_workpoints, id: false do |t|
        t.belongs_to :user
        t.belongs_to :workpoint
      end

    end

end
