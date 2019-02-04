class AddDepartToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :department_id, :integer
  end
end
