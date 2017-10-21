class AddHpcToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :hpc_id, :integer
    remove_column :patients, :eps_id, :integer
  end
end
