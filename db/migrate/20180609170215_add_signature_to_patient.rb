class AddSignatureToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :firma_paciente, :text
    add_column :patients, :firma_psicologo, :text
  end
end
