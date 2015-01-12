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

    context "when format is JSON" do
      it "is 200" do
        get :show, { id: location.id, :format => :json }
        expect(response).to be_success
      end
    end
  end
end
