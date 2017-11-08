class CreateChildBrothers < ActiveRecord::Migration[5.1]
  def change
    create_table :child_brothers do |t|
      t.string :name
      t.string :sexo
      t.string :edad
      t.string :birthdate
      t.string :relationship
      t.string :observations
      t.integer :child_general_date_id

      t.timestamps
    end
  end
end
