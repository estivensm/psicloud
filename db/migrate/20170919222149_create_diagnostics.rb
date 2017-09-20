class CreateDiagnostics < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnostics do |t|
      t.string :name
      t.text :description
      t.integer :admin_user
      t.integer :user_id
      t.integer :count

      t.timestamps
    end
  end
end
