class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :file
      t.text :description
      t.boolean :state
      t.integer :user_id
      t.integer :admin_user

      t.timestamps
    end
  end
end
