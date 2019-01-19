class CreateOutcomeFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :outcome_families do |t|
      t.integer :clinic_history_family_id
      t.integer :clinic_history_couple_id
      t.text :diagnostic_description
      t.integer :therapeutic_goal
      t.integer :type_of_treatment

      t.timestamps
    end
  end
end
