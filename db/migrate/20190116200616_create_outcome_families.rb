class CreateOutcomeFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :outcome_families do |t|
      t.integer :clinic_history_family_id
      t.text :diagnostic_description
      t.text :therapeutic_goal
      t.text :type_of_treatment

      t.timestamps
    end
  end
end
