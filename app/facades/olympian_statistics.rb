class OlympianStatistics
  attr_reader :id

  def average_weight
    {
      unit: "kg",
      male_olympians: Olympian.avg_weight("M").to_f.round(2),
      female_olympians: Olympian.avg_weight("F").to_f.round(2)
    }
  end

  def average_age
    Olympian.avg_age.to_f.round(2)
  end

  def total_competing_olympians
    Olympian.all.count
  end

end
