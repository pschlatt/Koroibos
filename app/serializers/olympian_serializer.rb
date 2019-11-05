class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :team, :age, :sport, :total_medals_won
end
