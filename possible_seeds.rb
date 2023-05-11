require 'faker'

puts 'Cleaning database...'
Bungalow.destroy_all
User.destroy_all
Challenge.destroy_all
Mission.destroy_all
puts 'Finished!'

puts 'Creating 12 bungalows...'
12.times do
  bungalow = Bungalow.new(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph
  )
  bungalow.save!
end
puts 'Finished!'

puts 'Creating 10 gays...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    telegram_user: Faker::Internet.username,
    bungalow: Bungalow.all.sample
  )
  user.save!
end
puts 'Finished!'

puts 'Creating 15 challenges...'
15.times do
  challenge = Challenge.new(
    description: Faker::Lorem.paragraph
  )
  challenge.save!
end
puts 'Finished!'

puts 'Creating missions...'

mission_one = Mission.new(
  challenge: Challenge.all.first,
  user: User.all.first,
  target_user: User.all.second,
  status: 'pending'
)
mission_one.save!

mission_two = Mission.new(
  challenge: Challenge.all.second,
  user: User.all.second,
  target_user: User.all.third,
  status: 'pending'
)
mission_two.save!

mission_three = Mission.new(
  challenge: Challenge.all.third,
  user: User.all.third,
  target_user: User.all.fourth,
  status: 'pending'
)
mission_three.save!

mission_four = Mission.new(
  challenge: Challenge.all.fourth,
  user: User.all.fourth,
  target_user: User.all.first,
  status: 'pending'
)
mission_four.save!

puts 'Finished!'

# Random users
User.create(email: "lady@gaga.com", password: "123456", first_name: "Lady", last_name: "Gaga", telegram_user: "ladygaga")
User.create(email: "katy@perry.com", password: "123456", first_name: "Katy", last_name: "Perry", telegram_user: "katyperry")
User.create(email: "ariana@grande.com", password: "123456", first_name: "Ariana", last_name: "Grande", telegram_user: "arianagrande")
User.create(email: "miley@cyrus.com", password: "123456", first_name: "Miley", last_name: "Cyrus", telegram_user: "mileycyrus")
