class EventSerializer
  include FastJsonapi::ObjectSerializer
    attribute :sport do |sport|
      sport.name
    end

    attribute :events do |event|
      event.events
    end

  end
