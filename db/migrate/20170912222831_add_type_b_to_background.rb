class AddTypeBToBackground < ActiveRecord::Migration[5.1]
  def change
    add_column :backgrounds, :type_background, :string
  end
end
