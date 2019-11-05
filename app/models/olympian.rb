class Olympian < ApplicationRecord
  validates_presence_of :name,
                        :sex,
                        :age,
                        :weight,
                        :height
  has_many :competitions
  has_many :events, through: :competitions
  belongs_to :team
end
