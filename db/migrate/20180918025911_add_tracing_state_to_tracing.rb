class AddTracingStateToTracing < ActiveRecord::Migration[5.1]
  def change
    add_column :tracings, :tracing_state, :boolean
    add_column :tracings, :tracing_created_at, :datetime
  end
end
