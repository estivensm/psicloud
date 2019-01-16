class AddIdeToGeneralFile < ActiveRecord::Migration[5.1]
  def change
    add_column :general_files, :tracing_couple_family_id, :integer
  end
end
