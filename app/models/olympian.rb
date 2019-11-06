class Olympian < ApplicationRecord
  validates_presence_of :name,
                        :sex,
                        :age,
                        :weight,
                        :height
  has_many :competitions
  has_many :events, through: :competitions
  belongs_to :team

  def self.youngest
   order(age: :asc).first
  end

  def self.oldest
   order(age: :desc).first
  end

end
