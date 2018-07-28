class AddFieldToGeneralField < ActiveRecord::Migration[5.1]
  def change
    add_column :general_files, :document_id, :integer
    add_column :general_files, :personal_background_id, :integer
    add_column :general_files, :background_id, :integer
  end
end
