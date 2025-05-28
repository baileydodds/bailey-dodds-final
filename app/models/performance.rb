# == Schema Information
#
# Table name: performances
#
#  id           :bigint           not null, primary key
#  performed_on :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  habit_id     :integer
#  user_id      :integer
#
class Performance < ApplicationRecord
  belongs_to(:user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true)
  belongs_to(:habit, required: true, class_name: "Habit", foreign_key: "habit_id")
end
