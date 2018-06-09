class AddFirmaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firma_psicologo, :text
  end
end
