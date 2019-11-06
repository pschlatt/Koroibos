class EventMedalistSerializer
  include FastJsonapi::ObjectSerializer

  attributes :event, :medalists

  end
