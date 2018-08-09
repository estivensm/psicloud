class CreateConsents < ActiveRecord::Migration[5.1]
  def change
    create_table :consents do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :account_id
      t.text :body
      t.string :title
      t.integer :first_age
      t.integer :second_age

      t.timestamps
    end
  end
end
