require 'rails_helper'

RSpec.describe Admin::LocationsController, :type => :controller do

  let(:country) { create(:country) }
  let(:city) { create(:city) }

  let(:invalid_attributes) do
    location.attributes.merge(latitude: nil)
  end

  describe 'GET index' do
    let(:locations) { FactoryGirl.create_list(:location, 3, city: city) }

    it "assigns @city" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(assigns(:city)).to eq(city)
    end

    it "assigns @locations" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(assigns(:locations)).to eq(locations)
    end

    it "is successful" do
      get :index, { country_id: country.id, city_id: city.id }
      expect(response).to be_success
    end
  end


  describe 'GET show' do
    let(:location) { create(:location) }

    it "assigns @location" do
      get :show, { country_id: country.id, city_id: city.id, id: location.id }
      expect(assigns(:location)).to eq(location)
    end

    it "is successful" do
      get :show, { country_id: country.id, city_id: city.id, id: location.id }
      expect(response).to be_success
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show, { country_id: country.id, city_id: city.id, id: location.id }
    end
  end


  describe 'GET new' do
    let(:location) { build(:location) }

    it "assigns @location" do
      get :new, { country_id: country.id, city_id: city.id }
      expect(assigns(:location)).to be_a_new(Location)
    end

    it "is successful" do
      get :new, { country_id: country.id, city_id: city.id }
      expect(response).to be_success
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :new, { country_id: country.id, city_id: city.id }
    end
  end

  describe 'POST create' do
    let(:location) { build(:location) }

    it "assigns @city" do
      post :create, { country_id: country.id, city_id: city.id, location: location.attributes }
      expect(assigns(:city)).to be_instance_of(City)
    end

    it "assigns @location" do
      post :create, { country_id: country.id, city_id: city.id, location: location.attributes }
      expect(assigns(:location)).to be_a(Location)
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      post :create, { country_id: country.id, city_id: city.id, location: location.attributes }
    end

    context "when valid" do
      it "creates a new Location" do
        expect do
          post :create, { country_id: country.id, city_id: city.id, location: location.attributes }
        end.to change(Location, :count).by(1)
      end

      it "is redirect" do
        post :create, { country_id: country.id, city_id: city.id, location: location.attributes }
        expect(response).to redirect_to admin_city_locations_path(city)
      end
    end

    context "when invalid" do
      it "is successful" do
        post :create, { country_id: country.id, city_id: city.id, location: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'GET edit' do
    let!(:location) { create(:location) }

    it "assigns @location" do
      get :edit, { country_id: country.id, city_id: city.id, id: location.id }
      expect(assigns(:location)).to eq(location)
    end

    it "is successful" do
      get :edit, { country_id: country.id, city_id: city.id, id: location.id }
      expect(response).to be_success
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :edit, { country_id: country.id, city_id: city.id, id: location.id }
    end
  end

  describe 'PATCH update' do
    let!(:location) { create(:location) }
    let(:invalid_attributes) { { name: '' } }

    it "assigns @location" do
      patch :update, { city_id: city.id, id: location.id, location: location.attributes }
      expect(assigns(:location)).to be_a(Location)
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      patch :update, { city_id: city.id, id: location.id, location: location.attributes }
    end

    context "when valid" do
      it "is redirect" do
        patch :update, { city_id: city.id, id: location.id, location: location.attributes }
        expect(response).to redirect_to admin_city_locations_path(location.city)
      end
    end

    context "when invalid" do
      it "is successful" do
        patch :update, { city_id: city.id, id: location.id, location: invalid_attributes }
        expect(response).to be_success
      end
    end
  end


  describe 'DELETE destroy' do
    let!(:location) { create(:location) }

    it "assigns @location" do
      delete :destroy, { country_id: country.id, city_id: city.id, id: location.id }
      expect(assigns(:location)).to be_a(Location)
    end

    it "destroys the Location" do
      expect do
        delete :destroy, { country_id: country.id, city_id: city.id, id: location.id }
      end.to change(Location, :count).by(-1)
    end

    it "is redirect" do
      delete :destroy, { country_id: country.id, city_id: city.id, id: location.id }
      expect(response).to redirect_to admin_city_locations_path(location.city)
    end
  end
end
