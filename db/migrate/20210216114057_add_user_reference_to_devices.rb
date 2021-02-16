class AddUserReferenceToDevices < ActiveRecord::Migration[6.0]
  def change
    add_reference(:devices, :user, foreign_key: true)
  end
end
