class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions, dependent: :destroy
  belongs_to :bungalow, optional: true
  after_create :create_user_mission

  def create_user_mission
    Mission.create(user: self, challenge: Challenge.all.sample, status: "pending", target_user: User.where.not(id: self.id).sample)
  end
end
