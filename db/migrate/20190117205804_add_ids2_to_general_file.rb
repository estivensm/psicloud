class AddIds2ToGeneralFile < ActiveRecord::Migration[5.1]
  def change
    add_column :general_files, :document_family_id, :integer
  end
end
