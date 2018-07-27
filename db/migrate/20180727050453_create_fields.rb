class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :type_field
      t.boolean :state
      t.integer :user_id
      t.integer :admin_user
      t.boolean :requierd
      t.string :form

      t.timestamps
    end
  end
end
