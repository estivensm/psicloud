class AddCityToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :city_id, :integer
  end
end
