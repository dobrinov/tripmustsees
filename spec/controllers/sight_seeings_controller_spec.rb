require "rails_helper"

RSpec.describe SightSeeingsController, :type => :controller do

  describe 'GET show' do
    context "when SightSeeing exist" do
      it "assigns @sight_seeing" do
        sight_seeing = create(:sight_seeing)

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
