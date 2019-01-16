class CreateClinicHistoryFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_history_families do |t|
      t.text :reason_consultation
      t.text :antecedent_problem
      t.text :family_problem

      t.timestamps
    end
  end
end
