class ChangeBookingsStatustoInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :status, :integer, using: 'status::integer'
  end
end
