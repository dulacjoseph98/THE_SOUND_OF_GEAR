class AddRatingsToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :rating, :integer
    add_column :devices, :description, :text
  end
end
