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
  belongs_to( :user, required: true, class_name: "User", foreign_key: "user_id" )
  has_many( :performances, class_name: "Performance", foreign_key: "habit_id", dependent: :destroy )
end
