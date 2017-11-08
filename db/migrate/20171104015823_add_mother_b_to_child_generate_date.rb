class AddMotherBToChildGenerateDate < ActiveRecord::Migration[5.1]
  def change
    add_column :child_general_dates, :mother_birthday, :date
  end
end
