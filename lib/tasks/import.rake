require 'csv'

task import: :environment do
  CSV.foreach('db/csv_data/olympic_data_2016.csv', headers: true) do |row|
    sport = Sport.find_or_create_by(
      name: row.to_hash['Sport']
    )
  end
end
