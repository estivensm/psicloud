class CreateCreatedFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :created_formats do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :admin_user
      t.text :format

      t.timestamps
    end
  end
end
