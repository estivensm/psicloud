class AddCFieldToCreteField < ActiveRecord::Migration[5.1]
  def change
    add_column :crete_fields, :check_box_field, :boolean
    add_column :crete_fields, :text_field, :string
    add_column :crete_fields, :select_field, :string
  end
end
