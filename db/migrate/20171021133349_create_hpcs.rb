class CreateHpcs < ActiveRecord::Migration[5.1]
  def change
    create_table :hpcs do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :admin_user

      t.timestamps
    end
  end
end
