class AddFirmaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firma_adjunta, :string
    add_column :users, :tipo_firma, :string
  end
end
