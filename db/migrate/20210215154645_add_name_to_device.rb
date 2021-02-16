class AddNameToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :name, :string
  end
end
