class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :commentable, polymorphic: true, null: false, index: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
