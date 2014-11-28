require 'rails_helper'

RSpec.describe Admin::SightSeeingsController, :type => :controller do

  let(:country) { create(:country) }
  let(:city) { create(:city) }
  let(:sight_seeing) { create(:sight_seeing) }

  let(:valid_attributes) {
    { name: 'Name' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  describe 'GET index' do
    let(:sight_seeings) { FactoryGirl.create_list(:sight_seeing, 3, city: city) }

    it "assigns @country" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(assigns(:country)).to eq(country)
    end

    it "assigns @city" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(assigns(:city)).to eq(city)
    end

    it "assigns @sight_seeings" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(assigns(:sight_seeings)).to eq(sight_seeings)
    end

    it "is successful" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it "assigns @sight_seeing" do
      get :show, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:sight_seeing)).to eq(sight_seeing)
    end

    it "is successful" do
      get :show, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(response).to be_success
    end
  end

  describe 'GET new' do
    it "assigns @sight_seeing" do
      get :new, { country_id: country.id, city_id: city.id }
      expect(assigns(:sight_seeing)).to be_a_new(SightSeeing)
    end

    it "is successful" do
      get :new, { country_id: country.id, city_id: city.id }
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it "assigns @country" do
      post :create, { country_id: country.id, city_id: city.id }
      expect(assigns(:country)).to be_instance_of(Country)
    end

    it "assigns @city" do
      post :create, { country_id: country.id, city_id: city.id }
      expect(assigns(:city)).to be_instance_of(City)
    end

    it "assigns @sight_seeing" do
      post :create, { country_id: country.id, city_id: city.id }
      expect(assigns(:sight_seeing)).to be_a_new(SightSeeing)
    end

    context "when valid" do
      it "creates a new SightSeeing" do
        expect do
          post :create, { country_id: country.id, city_id: city.id, sight_seeing: valid_attributes }
        end.to change(SightSeeing, :count).by(1)
      end

      it "is redirect" do
        post :create, { country_id: country.id, city_id: city.id, sight_seeing: valid_attributes }
        expect(response).to redirect_to admin_country_city_sight_seeings_path(country, city)
      end
    end

    context "when invalid" do
      it "is successful" do
        post :create, { country_id: country.id, city_id: city.id, sight_seeing: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'GET edit' do
    it "assigns @sight_seeing" do
      get :edit, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:sight_seeing)).to eq(sight_seeing)
    end

    it "is successful" do
      get :edit, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(response).to be_success
    end
  end

  describe 'PATCH update' do
    let!(:sight_seeing) { create(:sight_seeing) }

    it "assigns @country" do
      patch :update, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:country)).to be_instance_of(Country)
    end

    it "assigns @city" do
      patch :update, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:city)).to be_instance_of(City)
    end

    it "assigns @sight_seeing" do
      patch :update, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:sight_seeing)).to be_a(SightSeeing)
    end

    context "when valid" do
      it "is redirect" do
        patch :update, { country_id: country.id, city_id: city.id, id: sight_seeing.id, sight_seeing: valid_attributes }
        expect(response).to redirect_to admin_country_city_sight_seeings_path(country, city)
      end
    end

    context "when invalid" do
      it "is successful" do
        patch :update, { country_id: country.id, city_id: city.id, id: sight_seeing.id, sight_seeing: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:sight_seeing) { create(:sight_seeing) }

    it "assigns @country" do
      delete :destroy, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:country)).to be_instance_of(Country)
    end

    it "assigns @city" do
      delete :destroy, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:city)).to be_instance_of(City)
    end

    it "assigns @sight_seeing" do
      delete :destroy, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(assigns(:sight_seeing)).to be_a(SightSeeing)
    end

    it "destroys the SightSeeing" do
      expect do
        delete :destroy, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      end.to change(SightSeeing, :count).by(-1)
    end

    it "is redirect" do
      delete :destroy, { country_id: country.id, city_id: city.id, id: sight_seeing.id }
      expect(response).to redirect_to admin_country_city_sight_seeings_path(country, city)
    end
  end

end
