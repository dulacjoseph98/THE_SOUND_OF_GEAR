class AddAdressAndCoordinatesToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :address, :string
    add_column :devices, :latitude, :float
    add_column :devices, :longitude, :float
  end
end
