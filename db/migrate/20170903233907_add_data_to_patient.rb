class AddDataToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :data, :text
  end
end
