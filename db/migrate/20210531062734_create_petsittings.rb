class CreatePetsittings < ActiveRecord::Migration[6.0]
  def change
    create_table :petsittings do |t|
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
