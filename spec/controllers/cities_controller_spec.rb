require "rails_helper"

RSpec.describe CitiesController, :type => :controller do

  describe 'GET show' do
    context "when City exist" do
      it "assigns @city" do
        city = create(:city)

        get :show, {
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
