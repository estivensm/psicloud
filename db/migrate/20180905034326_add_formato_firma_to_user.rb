class AddFormatoFirmaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :signature_format, :text
  end
end
