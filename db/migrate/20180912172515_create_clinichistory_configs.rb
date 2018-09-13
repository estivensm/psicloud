class CreateClinichistoryConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :clinichistory_configs do |t|
      t.string :header_image
      t.string :footer_image
      t.text :header_text
      t.text :footer_text
      t.string :state
      t.integer :admin_user
      t.integer :user_id

      t.timestamps
    end
  end
end
