class AddDateToTracing < ActiveRecord::Migration[5.1]
  def change
    add_column :tracings, :tracing_date, :date
  end
end
