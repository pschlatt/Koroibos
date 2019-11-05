require "rails_helper"

RSpec.describe Competition, type: :model do

  describe "Validations" do
    it {should validate_presence_of(:medal)}
  end

  describe "Relationships" do
    it {should belong_to(:event)}
    it {should belong_to(:olympian)}
  end

end
