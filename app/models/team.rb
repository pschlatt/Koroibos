class Team < ApplicationRecord
  validates_presence_of :name
  has_many :olympians
end
