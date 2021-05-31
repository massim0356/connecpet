class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender
      t.references :receiver

      t.timestamps
    end
  end
end
