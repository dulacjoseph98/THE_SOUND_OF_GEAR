class AddUserReferencesToDevices < ActiveRecord::Migration[6.0]
  def change
    add_reference :devices, :user, null: false, foreign_key: true
  end
end
