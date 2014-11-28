require 'rails_helper'

RSpec.describe Admin::CitiesController, :type => :controller do

  let(:country) { create(:country) }


  describe 'GET index' do
    let(:cities) { FactoryGirl.create_list(:city, 3, country: country) }

    it "assigns @country" do
      get :index, { country_id: country.id }
      expect(assigns(:country)).to eq(country)
    end

    it "assigns @cities" do
      get :index, { country_id: country.id }
      expect(assigns(:cities)).to eq(cities)
    end

    it "is successful" do
      get :index, { country_id: country.id }
      expect(response).to be_success
    end
  end


  describe 'GET new' do
    it "assigns @country" do
      get :new, { country_id: country.id }
      expect(assigns(:country)).to eq(country)
    end

    it "assigns @city" do
      get :new, { country_id: country.id }
      expect(assigns(:city)).to be_a_new(City)
    end

    it "is successful" do
      get :new, { country_id: country.id }
      expect(response).to be_success
    end
  end


  describe 'POST create' do
    it "assigns @country" do
      post :create, { country_id: country.id }
      expect(assigns(:country)).to eq(country)
    end

    it "assigns @city" do
      post :create, { country_id: country.id }
      expect(assigns(:city)).to be_instance_of(City)
    end

    context "when valid" do
      before { allow_any_instance_of(City).to receive(:valid?).and_return(true) }

      it "creates a new City" do
        expect { post :create, { country_id: country.id } }.to change(City, :count).by(1)
      end

      it "is redirect" do
        post :create, { country_id: country.id }
        expect(response).to redirect_to admin_country_cities_path(country)
      end
    end

    context "when invalid" do
      before { allow_any_instance_of(City).to receive(:valid?).and_return(false) }

      it "is successful" do
        post :create, { country_id: country.id }
        expect(response).to be_success
      end
    end
  end
end
