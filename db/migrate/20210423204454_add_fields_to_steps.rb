class AddFieldsToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :is_done, :boolean, default: false, null: false
    add_column :steps, :short_description, :string, null: false
  end
end
