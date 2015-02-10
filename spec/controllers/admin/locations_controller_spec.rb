require 'rails_helper'

RSpec.describe Admin::LocationsController, :type => :controller do

  let(:invalid_attributes) do
    location.attributes.merge(latitude: nil)
  end

  describe 'GET index' do
    context "when in context of City" do
      let(:city) { create(:city) }
      let(:locations) { FactoryGirl.create_list(:location, 3, city: city) }

      it "assigns @city" do
        get :index, { city_id: city.id }
        expect(assigns(:city)).to eq(city)
      end

      it "assigns @locations" do
        get :index, { city_id: city.id }
        expect(assigns(:locations)).to eq(locations)
      end

      it "is successful" do
        get :index, { city_id: city.id }
        expect(response).to be_success
      end
    end

    context "when in context of LocationCategory" do
      let(:location_category) { FactoryGirl.create(:location_category) }
      let(:locations) { FactoryGirl.create_list(:location, 3, location_category: location_category) }

      it "assigns @location_category" do
        get :index, { location_category_id: location_category.id }
        expect(assigns(:location_category)).to eq(location_category)
      end

      it "assigns @locations" do
        get :index, { location_category_id: location_category.id }
        expect(assigns(:locations)).to eq(locations)
      end

      it "is successful" do
        get :index, { location_category_id: location_category.id }
        expect(response).to be_success
      end
    end
  end


  describe 'GET show' do
    let(:location) { create(:location) }

    it "assigns @location" do
      get :show, { id: location.id }
      expect(assigns(:location)).to eq(location)
    end

    it "is successful" do
      get :show, { id: location.id }
      expect(response).to be_success
    end
  end


  describe 'GET new' do
    let(:city) { create(:city) }
    let(:location) { build(:location) }

    it "assigns @location" do
      get :new, { city_id: city.id }
      expect(assigns(:location)).to be_a_new(Location)
    end

    it "is successful" do
      get :new, { city_id: city.id }
      expect(response).to be_success
    end
  end


  describe 'POST create' do
    let(:city) { create(:city) }
    let(:location) { build(:location) }

    it "assigns @city" do
      post :create, { city_id: city.id, location: location.attributes }
      expect(assigns(:city)).to be_instance_of(City)
    end

    it "assigns @location" do
      post :create, { city_id: city.id, location: location.attributes }
      expect(assigns(:location)).to be_a(Location)
    end

    context "when valid" do
      it "creates a new Location" do
        expect do
          post :create, { city_id: city.id, location: location.attributes }
        end.to change(Location, :count).by(1)
      end

      it "is redirect" do
        post :create, { city_id: city.id, location: location.attributes }
        expect(response).to redirect_to admin_city_locations_path(city)
      end
    end

    context "when invalid" do
      it "is successful" do
        post :create, { city_id: city.id, location: invalid_attributes }
        expect(response).to be_success
      end
    end
  end


  describe 'GET edit' do
    let!(:location) { create(:location) }

    it "assigns @location" do
      get :edit, { id: location.id }
      expect(assigns(:location)).to eq(location)
    end

    it "is successful" do
      get :edit, { id: location.id }
      expect(response).to be_success
    end
  end


  describe 'PATCH update' do
    let!(:location) { create(:location) }
    let(:invalid_attributes) { { name: '' } }

    it "assigns @location" do
      patch :update, { id: location.id, location: location.attributes }
      expect(assigns(:location)).to be_a(Location)
    end

    context "when valid" do
      it "is redirect" do
        patch :update, { id: location.id, location: location.attributes }
        expect(response).to redirect_to admin_city_locations_path(location.city)
      end
    end

    context "when invalid" do
      it "is successful" do
        patch :update, { id: location.id, location: invalid_attributes }
        expect(response).to be_success
      end
    end
  end


  describe 'DELETE destroy' do
    let!(:location) { create(:location) }

    it "assigns @location" do
      delete :destroy, { id: location.id }
      expect(assigns(:location)).to be_a(Location)
    end

    it "destroys the Location" do
      expect do
        delete :destroy, { id: location.id }
      end.to change(Location, :count).by(-1)
    end

    it "is redirect" do
      delete :destroy, { id: location.id }
      expect(response).to redirect_to admin_city_locations_path(location.city)
    end
  end
end
