require 'faker'

# Seed users

Booking.destroy_all
Boxer.destroy_all
User.destroy_all

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
  user.photo.attach(io: File.open('app/assets/images/logo.png'), filename: 'logo.png')
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
      address: "#{Faker::Address.street_address}, Paris",
      price_per_day: rand(100..150),
      gender: ["male", "female", "other"].sample,
      availability_radius: rand(1..50),
      user_id: user.id
    )
    boxer.photo.attach(io: File.open('app/assets/images/MMA_1.png'), filename: 'MMA_1.png')
    boxer.save!
    puts "created boxer: #{boxer.first_name} #{boxer.last_name}"
  end
end

# Seed bookings (1 per user)

User.all.each do |user|
  5.times do
    begin_date = Faker::Date.between(from: Date.today, to: 1.year.from_now)
    booking = Booking.new(
      address: Faker::Travel::Airport.name(size: 'small', region: 'united_states'),
      start_date: begin_date,
      end_date: begin_date + 1.days,
      status: ["pending", "validated", "refused", "done"].sample
    )
    booking.user = user
    booking.boxer = Boxer.all.sample
    booking.price = booking.boxer.price_per_day
    booking.save!
    puts "created booking: #{booking.boxer.first_name} #{booking.boxer.last_name} will beat up #{booking.user.first_name} #{booking.user.last_name}"
  end
end

seed_user = User.new(
  password: "fightclub",
  first_name: "Edward",
  last_name: "Norton",
  age: rand(18..80),
  email: "edward.norton@gmail.com"
)
seed_user.photo.attach(io: File.open('app/assets/images/norton.jpg'), filename: 'norton.jpg')
seed_user.save!

seed_boxer = Boxer.new(
  first_name: "Brad",
  last_name: "Pitt",
  age: 26,
  weight: 75,
  height: 185,
  address: "68, avenue Parmentier, Paris",
  price_per_day: 200_000,
  gender: "male",
  availability_radius: rand(1..50),
  user_id: User.first.id
)
seed_boxer.photo.attach(io: File.open('app/assets/images/brad.jpeg'), filename: 'brad.jpeg')
seed_boxer.save!
