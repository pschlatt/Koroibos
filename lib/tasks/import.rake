require 'csv'

task import: :environment do
  CSV.foreach('db/csv_data/olympic_data_2016.csv', headers: true) do |row|
    sport = Sport.find_or_create_by(
      name: row.to_hash['Sport']
    )
    team = Team.find_or_create_by(
      name: row.to_hash['Team']
    )
    olympian = Olympian.find_or_create_by(
      name: row.to_hash['Name'],
      sex: row.to_hash['Sex'],
      age: row.to_hash['Age'],
      weight: row.to_hash['Weight'],
      height: row.to_hash['Height'],
      team_id: team.id
    )
    event = Event.find_or_create_by(
      name: row.to_hash['Event'],
      sport_id: sport.id
    )
    Competition.find_or_create_by(
      medal: row.to_hash['Medal'],
      olympian_id: olympian.id,
      event_id: event.id
    )
  end
end
