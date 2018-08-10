class AddHeaderToConsent < ActiveRecord::Migration[5.1]
  def change
    add_column :consents, :header, :text
    add_column :consents, :footer, :text
  end
end
