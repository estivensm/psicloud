class AddCampChildrenToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :children, :string
    add_column :patients, :number_children, :integer
  end
end
