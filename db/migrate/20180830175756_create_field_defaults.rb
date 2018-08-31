class CreateFieldDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :field_defaults do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :account_id
      t.boolean :observation_tracing_state
      t.boolean :evolution_tracing_state
      t.boolean :description_tracing_state

      t.timestamps
    end
  end
end
