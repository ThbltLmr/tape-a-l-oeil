require 'faker'

# Seed users

60.times do
  name = Faker::Name.first_name
  family_name = Faker::Name.last_name
  user = User.new(
    password: Faker::Internet.password(min_length: 10, max_length: 15),
    first_name: name,
    last_name: family_name,
    age: rand(18..80),
    email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
  )
  user.save!
  puts "created #{user.first_name} #{user.last_name}"
end

# Seed boxers (33% of users)

User.all.each do |user|
  if rand() < 0.33
    boxer = Boxer.new(
      first_name: user.first_name,
      last_name: user.last_name,
      age: user.age,
      weight: rand(50..120),
      height: rand(160..200),
      address: Faker::Address.full_address,
      price_per_day: rand(100..150),
      gender: ["male", "female", "other"].sample,
      availability_radius: rand(1..50),
      user_id: user.id
    )
    boxer.save!
    puts "created boxer: #{boxer.first_name} #{boxer.last_name}"
  end
end

# Seed bookings (3 per user)

User.all.each do |user|
  begin_date = Faker::Date.between(from: Date.today, to: 1.year.from_now)
  booking = Booking.new(
    address: Faker::Address.full_address,
    start_date: begin_date,
    end_date: begin_date + 1.days
  )
  booking.user = user
  booking.boxer = Boxer.all.sample
  booking.price = booking.boxer.price_per_day * 8
  booking.save!
  puts "created booking: #{booking.boxer.first_name} #{booking.boxer.last_name} will beat up #{booking.user.first_name} #{booking.user.last_name}"
end
