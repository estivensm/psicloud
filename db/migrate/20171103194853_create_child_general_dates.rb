class CreateChildGeneralDates < ActiveRecord::Migration[5.1]
  def change
    create_table :child_general_dates do |t|
      t.string :father_name
      t.integer :father_age
      t.date :father_birthday
      t.string :father_job
      t.string :father_addictions
      t.string :father_relationship
      t.string :mother_name
      t.integer :mother_age
      t.string :mother_job
      t.string :parents_realationship
      t.string :reasons_relationship
      t.string :parents_reaction
      t.integer :patient_id
      t.integer :admin_user
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
