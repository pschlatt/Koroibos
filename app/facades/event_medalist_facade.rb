class EventMedalistFacade
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def event
    Event.find(@id).name
  end

  def medalists
     people = Competition.where(event_id: @id).distinct
     newpeople = people.map do |person|
        if person.medal != "NA"
          hash = { name: Olympian.find(person.olympian_id).name,
                   team: Team.find(Olympian.find(person.olympian_id).team_id).name,
                   age: Olympian.find(person.olympian_id).age,
                   medal: person.medal
                    }
        else
          "true"
        end
     end
     newpeople -= %w{true}
  end

end
