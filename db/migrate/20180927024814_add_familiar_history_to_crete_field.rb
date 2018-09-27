class AddFamiliarHistoryToCreteField < ActiveRecord::Migration[5.1]
  def change
    add_column :crete_fields, :child_general_date_id, :integer
  end
end
