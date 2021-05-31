class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.referencesreceiver :sender

      t.timestamps
    end
  end
end
