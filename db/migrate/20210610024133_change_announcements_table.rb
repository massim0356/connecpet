class ChangeAnnouncementsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :read, :boolean, default: false
    remove_reference :announcements, :pet
    add_reference :announcements, :user, foreign_key: true
    rename_column :announcements, :status, :title
  end
end
