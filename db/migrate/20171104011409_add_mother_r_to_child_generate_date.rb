class AddMotherRToChildGenerateDate < ActiveRecord::Migration[5.1]
  def change
    add_column :child_general_dates, :mother_addictions, :string
    add_column :child_general_dates, :mother_relationship, :string
  end
end
