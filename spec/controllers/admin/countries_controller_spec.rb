require 'rails_helper'

RSpec.describe Admin::CountriesController, :type => :controller do

  describe 'GET index' do
    let(:countries) { FactoryGirl.create_list(:country, 3) }

    it "assigns @countries" do
      get :index
      expect(assigns(:countries)).to eq(countries)
    end

    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end


  describe 'GET new' do
    let(:country) { build(:country) }

    it "assigns @country" do
      get :new
      expect(assigns(:country)).to be_a_new(Country)
    end

    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end


  describe 'POST create' do
    let(:country) { build(:country) }

    it "assigns @country" do
      post :create, country: country.attributes
      expect(assigns(:country)).to be_instance_of(Country)
    end

    context "when valid" do
      it "creates a new City" do
        expect { post :create, country: country.attributes }.to change(Country, :count).by(1)
      end

      it "is redirect" do
        post :create, country: country.attributes
        expect(response).to redirect_to admin_countries_path
      end
    end

    context "when invalid" do
      it "is successful" do
        post :create, country: {}
        expect(response).to be_success
      end
    end
  end
end
