class CreatePerformances < ActiveRecord::Migration[7.1]
  def change
    create_table :performances do |t|
      t.integer :habit_id
      t.integer :user_id
      t.date :performed_on

      t.timestamps
    end
  end
end
