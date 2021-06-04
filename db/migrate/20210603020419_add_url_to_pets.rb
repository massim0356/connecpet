class AddUrlToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :url, :string
  end
end

