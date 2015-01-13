require 'rails_helper'

RSpec.describe Location, :type => :model do

  describe "#country" do
    let!(:location) { create(:location) }

    it "returns Country" do
      expect(location.country).to eq(location.city.country)
    end
  end

  describe ".find_by_slug" do
    let!(:location) { create(:location) }

    context "when Location available" do
      it "returns Location by slug" do
        expect(Location.find_by_slug(location.country.slug, location.city.slug, location.slug)).to eq(location)
      end
    end


    context "when Location not available" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          Location.find_by_slug('non_exiting', 'non_exiting', 'non_exiting')
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
