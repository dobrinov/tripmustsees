require 'rails_helper'

RSpec.describe Location, :type => :model do

  describe "#country" do
    let!(:location) { create(:location) }

    it "returns Country" do
      expect(location.country).to eq(location.city.country)
    end
  end

end
