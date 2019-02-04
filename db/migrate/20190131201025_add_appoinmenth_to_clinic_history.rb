class AddAppoinmenthToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :appointment_id, :integer
  end
end
