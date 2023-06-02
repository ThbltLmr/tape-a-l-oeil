require 'faker'

# Seed users

Booking.destroy_all
Boxer.destroy_all
User.destroy_all

name = "Julien"
family_name = "Fonteneau"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Julien",
  last_name: "Fonteneau",
  age: 33,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/julien.jpeg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Manon"
family_name = "Roussel"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Manon",
  last_name: "Roussel",
  age: 23,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/manon.png'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Mohamed"
family_name = "Ali"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Mohamed",
  last_name: "Ali",
  age: 63,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/Mohamed-Ali.jpg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Rayan"
family_name = "Anser"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Rayan",
  last_name: "Anser",
  age: 23,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/rayan.jpeg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Totalus"
family_name = "Brutus"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Totalus",
  last_name: "Brutus",
  age: 33,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/random.jpg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Patrice"
family_name = "Quarteron"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Patrice",
  last_name: "Quarteron",
  age: 39,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/quarteron.jpeg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Conor"
family_name = "McGregor"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Conor",
  last_name: "McGregor",
  age: 33,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/mcgregor.jpg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

name = "Arnold"
family_name = "Schwarzenegger"
user = User.new(
  password: Faker::Internet.password(min_length: 10, max_length: 15),
  first_name: "Arnold",
  last_name: "Schwarzenegger",
  age: 39,
  email: Faker::Internet.email(name: "#{name} #{family_name}", domain: 'gmail.com')
)
user.photo.attach(io: File.open('app/assets/images/schwarzi.jpeg'), filename: 'logo.png')
user.save!
puts "created #{user.first_name} #{user.last_name}"

User.all.each do |user|
  boxer = Boxer.new(
    first_name: user.first_name,
    last_name: user.last_name,
    age: user.age,
    weight: rand(50..120),
    height: rand(160..200),
    address: Faker::Travel::Airport.name(size: 'small', region: 'united_states'),
    price_per_day: rand(100..150),
    gender: ["male", "female", "other"].sample,
    availability_radius: rand(1..50),
    user_id: user.id
  )
  boxer.photo.attach(user.photo.blob)
  boxer.save!
  puts "created boxer: #{boxer.first_name} #{boxer.last_name}"
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
  first_name: "Tyler",
  last_name: "Durden",
  age: 26,
  weight: 75,
  height: 185,
  address: "68, avenue Parmentier, Paris",
  price_per_day: 200_000,
  gender: "male",
  availability_radius: rand(1..50),
  user_id: seed_user.id
)
seed_boxer.photo.attach(io: File.open('app/assets/images/brad.jpeg'), filename: 'brad.jpeg')
seed_boxer.save!
