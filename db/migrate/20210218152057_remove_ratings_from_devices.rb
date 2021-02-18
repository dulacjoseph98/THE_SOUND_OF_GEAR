class RemoveRatingsFromDevices < ActiveRecord::Migration[6.0]
  def change
    remove_column :devices, :rating, :integer
  end
end
