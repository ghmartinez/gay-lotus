class RenameChallengeUsersToMissions < ActiveRecord::Migration[7.0]
  def change
    rename_table :challenge_users, :missions
  end
end
