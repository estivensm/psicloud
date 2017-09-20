class CreateBackgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :backgrounds do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.integer :clinic_history_id
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
