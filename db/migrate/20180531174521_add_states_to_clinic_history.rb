class AddStatesToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :first_child_state, :boolean
    add_column :clinic_histories, :second_child_state, :boolean
    add_column :clinic_histories, :third_child_state, :boolean
    add_column :clinic_histories, :four_child_state, :boolean
  end
end
