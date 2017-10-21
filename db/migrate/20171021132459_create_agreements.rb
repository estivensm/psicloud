class CreateAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :agreements do |t|
      t.string :name
      t.string :description
      t.float :percent
      t.integer :user_id
      t.integer :admin_user

      t.timestamps
    end
  end
end
