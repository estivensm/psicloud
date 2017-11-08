class AddChildHistoryToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :child_history, :boolean
  end
end
