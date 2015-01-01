require "rails_helper"

RSpec.describe LocationsController, :type => :controller do

  describe 'GET show' do
    let(:country)  { create(:country) }
    let(:city)     { create(:city)    }
    let(:location) { create(:location)    }

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show, {
                    country_slug:  location.city.country.slug,
                    city_slug:     location.city.slug,
                    location_slug: location.slug
                 }
    end

    context "when Location exist" do
      it "assigns @location" do
        get :show, {
                      country_slug:  location.city.country.slug,
                      city_slug:     location.city.slug,
                      location_slug: location.slug
                   }

        expect(assigns(:location)).to eq(location)
      end
    end

    context "when Location doesn't exist" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          get :show, {
                        country_slug:  'non_exiting',
                        city_slug:     'non_exiting',
                        location_slug: 'non_exiting'
                     }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
