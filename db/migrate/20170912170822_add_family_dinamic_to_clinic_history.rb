class AddFamilyDinamicToClinicHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :clinic_histories, :family_dinamic, :text
  end
end
