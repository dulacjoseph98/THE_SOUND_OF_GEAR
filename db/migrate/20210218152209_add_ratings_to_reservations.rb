class AddRatingsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :rating, :integer
  end
end
