require "rails_helper"

RSpec.describe CitiesController, :type => :controller do

  describe 'GET index' do
    let!(:country) { create(:country) }
    let!(:cities) { FactoryGirl.create_list(:city, 3, country: country) }

    context "when format is JSON" do
      it "is 200" do
        get :index, { country_id: country.id, :format => :json }
        expect(response).to be_success
      end
    end
  end


  describe 'GET show' do
    let(:city) { create(:city) }

    it "tracks page view" do
      expect(controller).to receive(:mixpanel_track_city_page_view)
      get :show,  {
                   country_slug: city.country.slug,
                   city_slug:    city.slug
                  }
    end

    it "is 200" do
      get :show,  {
                   country_slug: city.country.slug,
                   city_slug:    city.slug
                  }

      expect(response).to be_success
    end

    it "assigns @city" do
      get :show,  {
                   country_slug: city.country.slug,
                   city_slug:    city.slug
                  }

      expect(assigns(:city)).to be_a(City)
    end

    it "assigns @locations" do
      get :show,  {
                   country_slug: city.country.slug,
                   city_slug:    city.slug
                  }

      expect(assigns(:locations)).to be_a(ActiveRecord::AssociationRelation)
    end
  end

end
