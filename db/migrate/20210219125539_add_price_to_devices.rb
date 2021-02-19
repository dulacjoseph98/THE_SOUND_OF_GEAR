class AddPriceToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :price, :integer
  end
end
