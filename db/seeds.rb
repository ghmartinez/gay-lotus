require 'faker'

puts 'Cleaning database...'
Bungalow.destroy_all
User.destroy_all
Challenge.destroy_all
ChallengeUser.destroy_all
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
    status: ['pending', 'won', 'lost'].sample
  )
  challenge.save!
end
puts 'Finished!'

puts 'Creating 120 challenge_users...'
120.times do
  challenge_user = ChallengeUser.new(
    user: User.all.sample,
    challenge: Challenge.all.sample
  )
  challenge_user.save!
end
