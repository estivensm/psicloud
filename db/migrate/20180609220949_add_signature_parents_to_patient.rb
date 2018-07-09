class AddSignatureParentsToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :firma_madre, :text
    add_column :patients, :firma_padre, :text
  end
end
