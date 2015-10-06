class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|

      t.integer    :message_id
      t.references :attachable, polymorphic: true

    end
  end
end
