class CreateDocumentFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :document_families do |t|
      t.string :tool_type
      t.text :descripcion
      t.string :document_type
      t.string :name
      t.string :string
      t.integer :clinic_history_family_id

      t.timestamps
    end
  end
end
