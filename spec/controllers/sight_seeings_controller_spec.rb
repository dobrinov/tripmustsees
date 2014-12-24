require "rails_helper"

RSpec.describe SightSeeingsController, :type => :controller do

  describe 'GET show' do
    let(:country)      { create(:country) }
    let(:city)         { create(:city)    }
    let(:sight_seeing) { create(:sight_seeing)    }

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show, {
                    country_slug:      sight_seeing.city.country.slug,
                    city_slug:         sight_seeing.city.slug,
                    sight_seeing_slug: sight_seeing.slug
                 }
    end

    context "when SightSeeing exist" do
      it "assigns @sight_seeing" do
        get :show, {
                      country_slug:      sight_seeing.city.country.slug,
                      city_slug:         sight_seeing.city.slug,
                      sight_seeing_slug: sight_seeing.slug
                   }

        expect(assigns(:sight_seeing)).to eq(sight_seeing)
      end
    end

    context "when SightSeeing doesn't exist" do
      it "raises ActiveRecord::RecordNotFound" do
        expect do
          get :show, {
                        country_slug:      'non_exiting',
                        city_slug:         'non_exiting',
                        sight_seeing_slug: 'non_exiting'
                     }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
