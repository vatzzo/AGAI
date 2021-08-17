class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  class User < ApplicationRecord; end

  def change
    add_column :users, :full_name, :string
    add_column :users, :location, :string
    add_column :users, :phone_number, :integer
    add_column :users, :biography, :text
    add_column :users, :education, :text
    add_column :users, :profession, :string
  end
end
