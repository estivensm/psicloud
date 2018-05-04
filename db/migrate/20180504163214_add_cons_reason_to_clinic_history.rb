class AddConsReasonToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :consult_reason_id, :integer
  end
end
