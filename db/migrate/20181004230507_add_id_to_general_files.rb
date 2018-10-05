class AddIdToGeneralFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :general_files, :diagnostic_help_id, :integer
    add_column :general_files, :legal_document__id, :integer
  end
end
