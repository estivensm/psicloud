class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.date :birth_date
      t.integer :age
      t.string :document_type
      t.string :document
      t.string :occupation
      t.string :profession
      t.string :phone
      t.string :address
      t.string :email
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_relationship
      t.string :gender
      t.string :civil_status
      t.string :blood_type
      t.string :ethnic_group
      t.integer :user_id
      t.integer :admin_user
      t.integer :eps_id
      t.integer :count
      t.integer :agreement_id
      t.string :avatar
      t.string :movil
      t.string :city

      t.timestamps



      
    end
  end
end

