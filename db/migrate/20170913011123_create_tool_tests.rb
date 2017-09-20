class CreateToolTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tool_tests do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.integer :clinic_history_id
      t.string :type_tool
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
