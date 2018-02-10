class AddStateToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :state, :boolean
  end
end
