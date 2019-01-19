class AddId2ToGeneralFile < ActiveRecord::Migration[5.1]
  def change
    add_column :general_files, :tracing_family_id, :integer
  end
end
