class AddStateToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :first_contact_state, :boolean
    add_column :clinic_histories, :outcome_state, :boolean
  end
end
