class CreatePersonalBackgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_backgrounds do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.integer :clinic_history_id
      t.string :attachement
      t.string :description
      t.string :type_background

      t.timestamps
    end
  end
end
