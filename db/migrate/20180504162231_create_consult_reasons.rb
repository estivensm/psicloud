class CreateConsultReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :consult_reasons do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :name
      t.text :description
      t.integer :count

      t.timestamps
    end
  end
end
