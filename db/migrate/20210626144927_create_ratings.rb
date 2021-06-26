class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :grade, default: 0, null: false
      t.references :ratingable, polymorphic: true, null: false, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end