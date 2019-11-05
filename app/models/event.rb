class Event < ApplicationRecord
  validates_presence_of :name
  has_many :competitions
  has_many :olympians, through: :competitions
  belongs_to :sport
end
