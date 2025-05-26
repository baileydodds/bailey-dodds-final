class AddPerformancesCountToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :performances_count, :integer
  end
end
