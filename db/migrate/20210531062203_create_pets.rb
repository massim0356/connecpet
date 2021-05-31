class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.date :birthdate
      t.string :species
      t.string :breed
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
