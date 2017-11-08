class AddMonthToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :birthdate_month, :integer
    add_column :patients, :birthdate_day, :integer
    add_column :patients, :school_grade, :string
  end
end
