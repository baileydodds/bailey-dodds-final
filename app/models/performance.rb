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
end
