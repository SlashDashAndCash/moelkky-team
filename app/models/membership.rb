class Membership < ApplicationRecord
  belongs_to :team, class_name: "Team"
  belongs_to :player, class_name: "Player"
  validates  :team_id, presence: true
  validates  :player_id, presence: true
end
