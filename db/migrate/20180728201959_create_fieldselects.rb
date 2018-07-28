class CreateFieldselects < ActiveRecord::Migration[5.1]
  def change
    create_table :fieldselects do |t|
      t.integer :field_id
      t.integer :admin_user
      t.integer :user_id
      t.string :option

      t.timestamps
    end
  end
end
