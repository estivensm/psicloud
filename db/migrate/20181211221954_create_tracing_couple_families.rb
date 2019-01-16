class CreateTracingCoupleFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :tracing_couple_families do |t|
      t.integer :clinic_history_couple_id
      t.integer :clinic_history_family_id
      t.integer :admin_user
      t.integer :user_id
      t.text :description
      t.string :attachment
      t.string :tracing_type
      t.date :tracing_date
      t.text :observation
      t.text :evolution
      t.boolean :tracing_state

      t.timestamps
    end
  end
end
