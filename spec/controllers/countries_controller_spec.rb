require "rails_helper"

RSpec.describe CountriesController, :type => :controller do

  describe 'GET show' do
    let(:country) { create(:country) }

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show, country_slug: country.slug
    end

    it "tracks page view" do
      expect(controller).to receive(:mixpanel_track_country_page_view)
      get :show, country_slug: country.slug
    end

    context "when Country exist" do
      it "assigns @country" do
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
