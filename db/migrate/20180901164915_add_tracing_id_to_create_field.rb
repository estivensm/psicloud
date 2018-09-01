class AddTracingIdToCreateField < ActiveRecord::Migration[5.1]
  def change
    add_column :crete_fields, :tracing_id, :integer
  end
end
