class AddIdToGeneralFile < ActiveRecord::Migration[5.1]
  def change
    add_column :general_files, :legal_document_id, :integer
  end
end
