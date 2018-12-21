class CreateDocumentCoupleFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :document_couple_families do |t|
      t.string :tool_type
      t.text :descripcion
      t.string :document_type
      t.string :name
      t.integer :clinic_history_couple_id
      t.integer :clinic_history_family_id

      t.timestamps
    end

     add_column :general_files, :document_couple_family_id, :integer
  end
end
