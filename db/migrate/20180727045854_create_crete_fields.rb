class CreateCreteFields < ActiveRecord::Migration[5.1]
  def change
    create_table :crete_fields do |t|
      t.integer :admin_user
      t.integer :user_id
      t.text :content
      t.integer :clinic_history_id
      t.integer :field_id

      t.timestamps
    end
  end
end
