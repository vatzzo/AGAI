class AddConstraintsToSteps < ActiveRecord::Migration[6.1]
  def change
    change_column_null :steps, :title, false
  end
end
