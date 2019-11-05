class AddTeamToOlympians < ActiveRecord::Migration[5.2]
  def change
    add_reference :olympians, :team, foreign_key: true
  end
end
