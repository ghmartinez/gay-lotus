namespace :seed_challenges_users do
  desc 'Seed the join table of challenges and users.'
  task join_table_challenges_users: :environment do
    challenges = Challenge.all
    users = User.all

    challenges.each do |challenge|
      users.each do |user|
        challenges.users << user
      end
    end
  end
end
