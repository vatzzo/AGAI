class AddScoreToActivities < ActiveRecord::Migration[6.1]
  class Activity < ApplicationRecord; end

  def change
    add_column :activities, :score, :float, null: false, default: 0

    Activity.find_each { |activity| activity.update(score: 0) }
  end
end
