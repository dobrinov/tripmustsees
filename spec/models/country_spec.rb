require 'rails_helper'

RSpec.describe Country, :type => :model do
  it_behaves_like "imagable"

  describe ".find_by_slug" do
    let!(:country) { create(:country) }

    context "when Country available" do
      it "returns Country by slug" do
        expect(Country.find_by_slug(country.slug)).to eq(country)
      end
    end


    context "when Country not available" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          Country.find_by_slug('non_exiting')
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
