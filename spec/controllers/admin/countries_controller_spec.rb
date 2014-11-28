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
    it "assigns @country" do
      post :create
      expect(assigns(:country)).to be_instance_of(Country)
    end

    context "when valid" do
      before { allow_any_instance_of(Country).to receive(:valid?).and_return(true) }

      it "creates a new City" do
        expect { post :create }.to change(Country, :count).by(1)
      end

      it "is redirect" do
        post :create
        expect(response).to redirect_to admin_countries_path
      end
    end

    context "when invalid" do
      before { allow_any_instance_of(Country).to receive(:valid?).and_return(false) }

      it "is successful" do
        post :create
        expect(response).to be_success
      end
    end
  end
end
