class AddFirstContactCreateToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :first_contact_created_at, :datetime
  end
end
