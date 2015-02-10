require "rails_helper"

RSpec.describe LocationsController, :type => :controller do

  describe 'GET index' do
    let(:city) { create(:city) }

    context "when format is JSON" do
      it "is 200" do
        get :index, { city_id: city.id, :format => :json }
        expect(response).to be_success
      end
    end
  end


  describe 'GET show' do
    let(:city)     { create(:city) }
    let(:location) { create(:location) }

    context "when format is HTML" do
      it "tracks page view" do
        expect(controller).to receive(:mixpanel_track_location_page_view)
        get :show, {
                      country_slug:  location.city.country.slug,
                      city_slug:     location.city.slug,
                      location_slug: location.slug
                   }
      end

      context "when Location exist" do
        it "is 200" do
          get :show, {
                        country_slug:  location.city.country.slug,
                        city_slug:     location.city.slug,
                        location_slug: location.slug
                     }

          expect(response).to be_success
        end

        it "assigns @location" do
          get :show, {
                        country_slug:  location.city.country.slug,
                        city_slug:     location.city.slug,
                        location_slug: location.slug
                     }

          expect(assigns(:location)).to eq(location)
        end
      end

    end

    context "when format is JSON" do
      it "is 200" do
        get :show, { id: location.id, :format => :json }
        expect(response).to be_success
      end
    end
  end
end
