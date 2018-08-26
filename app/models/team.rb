class Team < ApplicationRecord
  has_many :active_memberships, class_name:  "Membership",
                                foreign_key: "team_id",
                                dependent:   :destroy
  has_many :players, through: :active_memberships

  validates :name, presence: true, length: { minimum: 3 }
end
