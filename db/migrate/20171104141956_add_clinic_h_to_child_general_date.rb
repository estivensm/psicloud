class AddClinicHToChildGeneralDate < ActiveRecord::Migration[5.1]
  def change
    add_column :child_general_dates, :clinic_history_id, :integer
  end
end
