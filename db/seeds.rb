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

puts 'Creating 75 gays...'
75.times do
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

puts 'Creating 120 challenges...'
120.times do
  challenge = Challenge.new(
    description: Faker::Lorem.paragraph,
  )
  challenge.save!
end
puts 'Finished!'

puts 'Creating 120 missions...'
75.times do
  mission = Mission.new(
    challenge: Challenge.all.sample,
    player_user: User.all.sample,
    target_user: User.all.sample,
    winner_user: User.all.sample,
    status: ['pending', 'completed'].sample
  )
  mission.save!
end
puts 'Finished!'
