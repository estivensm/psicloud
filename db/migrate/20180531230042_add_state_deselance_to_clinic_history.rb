class AddStateDeselanceToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :desenlace_first, :boolean
    add_column :clinic_histories, :desenlace_created_at, :datetime
  end
end
