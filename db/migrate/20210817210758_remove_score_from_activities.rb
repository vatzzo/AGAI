class RemoveScoreFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :score
  end
end
