class Player < ApplicationRecord
  has_many :active_memberships, class_name:  "Membership",
                                foreign_key: "player_id",
                                dependent:   :destroy
  has_many :teams, through: :active_memberships

  validates :name, presence: true, length: { minimum: 3 }
end
