# == Schema Information
#
# Table name: habits
#
#  id                :bigint           not null, primary key
#  habit_description :text
#  habit_name        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class Habit < ApplicationRecord
end
