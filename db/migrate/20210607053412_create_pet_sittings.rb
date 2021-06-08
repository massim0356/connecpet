class CreatePetSittings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :petsitting
    remove_reference :reviews, :petsitting
    drop_table :petsittings
    create_table :pet_sittings do |t|
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_reference :bookings, :pet_sitting, foreign_key: true
    add_reference :reviews, :pet_sitting, foreign_key: true
  end
end
