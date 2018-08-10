class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string :name
      t.string :genero
      t.integer :age
      t.string :relationship
      t.text :observations
      t.integer :child_general_date_id
      t.boolean :state

      t.timestamps
    end
  end
end
