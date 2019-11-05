require "rails_helper"

RSpec.describe Event, type: :model do

  describe "Validations" do
    it {should validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {should belong_to(:sport)}
    it {should have_many(:competitions)}
    it {should have_many(:olympians).through(:competitions)}
  end

end
