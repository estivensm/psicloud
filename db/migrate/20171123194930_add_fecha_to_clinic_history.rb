class AddFechaToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :created_date, :datetime
  end
end
