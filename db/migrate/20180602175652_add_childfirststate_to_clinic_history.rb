class AddChildfirststateToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :first_child_first, :boolean
    add_column :clinic_histories, :child_first_created_at, :datetime
    add_column :clinic_histories, :first_child_second, :boolean
    add_column :clinic_histories, :second_child_created_at, :datetime
    add_column :clinic_histories, :first_child_third, :boolean
    add_column :clinic_histories, :third_child_created_at, :datetime
    add_column :clinic_histories, :first_child_four, :boolean
    add_column :clinic_histories, :four_child_created_at, :datetime
  end
end
