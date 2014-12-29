require 'rails_helper'

RSpec.describe Location, :type => :model do

  describe "#country" do
    let!(:sight_seeing) { create(:sight_seeing) }

    it "returns Country" do
      expect(sight_seeing.country).to eq(sight_seeing.city.country)
    end
  end

end
