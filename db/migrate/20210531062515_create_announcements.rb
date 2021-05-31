class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.date :date
      t.text :content
      t.string :location
      t.string :status
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
