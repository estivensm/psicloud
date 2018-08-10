class AddStateToConsent < ActiveRecord::Migration[5.1]
  def change
    add_column :consents, :state, :boolean
  end
end
