class AddClaseToBackground < ActiveRecord::Migration[5.1]
  def change
    add_column :backgrounds, :clase, :string
  end
end
