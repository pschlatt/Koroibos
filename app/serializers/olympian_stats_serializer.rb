class OlympianStatsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total_competing_olympians, :average_weight, :average_age
end
