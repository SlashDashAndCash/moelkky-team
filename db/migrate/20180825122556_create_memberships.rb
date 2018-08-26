class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
    add_index :memberships, :team_id
    add_index :memberships, :player_id
    add_index :memberships, [:team_id, :player_id], unique: true
  end
end
