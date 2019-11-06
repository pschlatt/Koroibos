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

  it "User can see youngest Olympian" do
    get '/api/v1/olympian?age=youngest'
		expect(response).to be_successful
		results = JSON.parse(response.body)
    expect(results["data"]["attributes"]["age"]).to eq(18)
    expect(results["data"]["attributes"]["name"]).to eq("Maha Abdalsalam Gouda")
  end

  it "User can see oldest Olympian" do
    get '/api/v1/olympian?age=oldest'
    expect(response).to be_successful
    results = JSON.parse(response.body)
    expect(results["data"]["attributes"]["age"]).to eq(36)
    expect(results["data"]["attributes"]["name"]).to eq("Samy Abdel Razek")
  end

  it "User can see oldest Olympian" do
    get '/api/v1/olympian_stats'
    expect(response).to be_successful
    results = JSON.parse(response.body)
    expect(results["olympian_stats"]["data"]["attributes"]["average_age"]).to eq(26.0)
    expect(results["olympian_stats"]["data"]["attributes"]["average_weight"]["male_olympians"]).to eq(79.4)
  end
end
