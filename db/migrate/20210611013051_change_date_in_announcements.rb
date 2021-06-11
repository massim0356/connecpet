class ChangeDateInAnnouncements < ActiveRecord::Migration[6.0]
  def change
    change_column :announcements, :date, :datetime
  end
end
