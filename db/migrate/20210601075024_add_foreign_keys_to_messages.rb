class AddForeignKeysToMessages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :receiver
    remove_reference :messages, :sender
    add_reference :messages, :sender, null: false, foreign_key: { to_table: :users }
    add_reference :messages, :receiver, null: false, foreign_key: { to_table: :users }
  end
end
