class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
