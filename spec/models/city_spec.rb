require 'rails_helper'

RSpec.describe City, :type => :model do
  it_behaves_like "imagable"

  describe ".find_by_slug" do
    let!(:city) { create(:city) }

    context "when City available" do
      it "returns City by slug" do
        expect(City.find_by_slug(city.country.slug, city.slug)).to eq(city)
      end
    end


    context "when City not available" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          City.find_by_slug('non_exiting', 'non_exiting')
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
