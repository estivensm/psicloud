class CreateInvoiceConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_consultations do |t|
      t.date :invoice_date
      t.string :invoice_number
      t.float :consultation_value
      t.float :discount_value
      t.float :total_value
      t.text :comment
      t.integer :appointment_id

      t.timestamps
    end
  end
end
