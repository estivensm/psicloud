class CreateGeneralFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :general_files do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :file
      t.string :name
      t.integer :tool_test_id
      t.integer :tracing_id

      t.timestamps
    end
  end
end
