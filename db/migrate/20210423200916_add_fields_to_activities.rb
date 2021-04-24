class AddFieldsToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :is_public, :boolean, default: false, null: false
    add_column :activities, :deadline, :date, null: false
  end
end
