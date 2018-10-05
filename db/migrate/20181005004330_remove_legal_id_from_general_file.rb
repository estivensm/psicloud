class RemoveLegalIdFromGeneralFile < ActiveRecord::Migration[5.1]
  def change
    remove_column :general_files, :legal_document__id, :integer
  end
end
