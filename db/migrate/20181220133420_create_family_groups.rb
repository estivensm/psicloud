class CreateFamilyGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :family_groups do |t|
      t.string :name
      t.string :last_name
      t.integer :document_number
      t.integer :age
      t.string :sex
      t.string :civil_status
      t.string :occupation
      t.string :relationship
      t.integer :clinic_history_family_id

      t.timestamps
    end
  end
end
