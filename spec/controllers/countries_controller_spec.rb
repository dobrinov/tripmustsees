require "rails_helper"

RSpec.describe CountriesController, :type => :controller do

  describe 'GET show' do
    context "when Country exist" do
      it "assigns @country" do
        country = create(:country)

        get :show, country_slug: country.slug
        expect(assigns(:country)).to be_a(Country)
      end
    end

    context "when Country doesn't exist" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          get :show, {
                        country_slug: 'non_exiting'
                     }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
