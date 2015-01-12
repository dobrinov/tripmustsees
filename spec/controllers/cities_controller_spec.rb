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

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show,  {
                   country_slug: city.country.slug,
                   city_slug:    city.slug
                  }
    end

    context "when City exist" do
      it "assigns @city" do
        get :show,  {
                     country_slug: city.country.slug,
                     city_slug:    city.slug
                    }

        expect(assigns(:city)).to be_a(City)
      end
    end

    context "when City doesn't exist" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          get :show, {
                        country_slug: 'non_exiting',
                        city_slug:    'non_exiting'
                     }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
