class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.string :habit_name
      t.text :habit_description
      t.integer :user_id

      t.timestamps
    end
  end
end
