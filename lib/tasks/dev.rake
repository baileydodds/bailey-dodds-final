desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  puts "Sample data task running"
  if Rails.env.development?
    User.destroy_all
    Habit.destroy_all
    Performance.destroy_all
  end

  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence! (t)
    end
  end

  usernames = ["alice", "bob", "carol", "dave", "eve"]
  
  usernames.each do |username|

    user = User.new
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save

  end

5.times do
  habit = Habit.new
  habit.name = Faker::Address.community
  habit.user_id = User.all.sample.id
  habit.save


rand(10..50).times do
      performance = Performance.new
      performance.user_id = User.all.sample.id
      performance.habit_id = habit.id
      performance.performed_on = Faker::Date.backward(days: 120)
      performance.created_at = Faker::Datetime.backward(days: 120)
      performance.updated_at = Faker::Datetime.backward(days: 120)      
      performance.save
    end
  end


puts "There are now #{Habit.count} rows in the habits table."
puts "There are now #{Performance.count} rows in the performance table."
puts "There are now #{User.count} rows in the users table."
end
