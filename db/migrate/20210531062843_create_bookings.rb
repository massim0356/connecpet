class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :description
      t.string :status
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.references :petsitting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
