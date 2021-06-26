class AddIsAdminToUsers < ActiveRecord::Migration[6.1]
  class User < ApplicationRecord; end
  def change
    add_column :users, :is_admin, :boolean, null: false, default: false, index: true

    User.find_each { |user| user.update(is_admin: false) }
  end
end
