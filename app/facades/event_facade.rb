

class EventFacade
  attr_reader :id

  def sport
    all_sports = Sport.includes(:events)
    sports_displayed = all_sports.map do |sport|
                          hash = {
                                  sport: sport.name,
                                  events: sport.events.map do |event|
                                            event.name
                                          end
                                }
                        end
  end


end
