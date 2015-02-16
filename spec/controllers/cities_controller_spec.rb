require "rails_helper"

RSpec.describe CitiesController, :type => :controller do

  describe 'GET index' do
    let!(:country) { create(:country) }
    let!(:published_cities)   { FactoryGirl.create_list(:city, 3, country: country, published: true) }
    let!(:unpublished_cities) { FactoryGirl.create_list(:city, 3, country: country, published: false) }

    context "when format is JSON" do
      it "is 200" do
        get :index, { country_id: country.id, :format => :json }
        expect(response).to be_success
      end

      it "assigns @country" do
        get :index, { country_id: country.id, :format => :json }
        expect(assigns(:country)).not_to be_nil
      end

      it "assigns @cities" do
        get :index, { country_id: country.id, :format => :json }
        expect(assigns(:cities)).to eq(published_cities)
      end

      it "returns only published Cities" do
        get :index, { country_id: country.id, :format => :json }
        expect(response).to be_success
      end
    end
  end


  describe 'GET show' do
    let(:city) { create(:city) }

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show,  {
                   country_slug: city.country.slug,
                   city_slug:    city.slug
                  }
    end

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

      expect(assigns(:locations)).not_to be_nil
    end
  end

end
