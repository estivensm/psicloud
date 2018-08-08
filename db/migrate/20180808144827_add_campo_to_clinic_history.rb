class AddCampoToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :diagnostico_id, :integer
  end
end
