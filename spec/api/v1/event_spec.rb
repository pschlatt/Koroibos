require 'rails_helper'
require 'csv'

describe "Olympians API" do

  before :each do
    CSV.foreach('db/csv_testing_data/data.csv', headers: true) do |row|
      @medals = 0
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
        sport: row.to_hash['Sport'],
        total_medals_won:
                          if row.to_hash['Medal'] != "NA"
                            @medals += 1
                          else
                            @medals = 0
                          end,
        team_id: team.id,
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

  it "User can see all olympians" do
    get '/api/v1/events'
		expect(response).to be_successful
		results = JSON.parse(response.body)
    expect(results["data"][0]["attributes"]["sport"]).to eq("Weightlifting")
    expect(results["data"][0]["attributes"]["events"][0]["name"]).to eq("Weightlifting Women's Super-Heavyweight")
  end

end
