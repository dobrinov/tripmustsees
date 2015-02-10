require 'rails_helper'

RSpec.describe Admin::CountriesController, :type => :controller do

  let(:invalid_attributes) do
    country.attributes.merge(latitude: nil)
  end

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


  describe 'GET show' do
    let!(:country) { create(:country) }

    it "assigns @country" do
      get :show, id: country.id
      expect(assigns(:country)).to eq(country)
    end

    it "is successful" do
      get :show, id: country.id
      expect(response).to be_success
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :show, id: country.id
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

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :new
    end
  end


  describe 'POST create' do
    let(:country) { build(:country) }

    it "assigns @country" do
      post :create, country: country.attributes
      expect(assigns(:country)).to be_instance_of(Country)
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      post :create, country: country.attributes
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
        post :create, country: invalid_attributes
        expect(response).to be_success
      end
    end
  end


  describe 'GET edit' do
    let(:country) { create(:country) }

    it "assigns @country" do
      get :edit, id: country.id
      expect(assigns(:country)).to eq(country)
    end

    it "is successful" do
      get :edit, id: country.id
      expect(response).to be_success
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      get :edit, id: country.id
    end
  end


  describe 'PUT update' do
    let!(:country) { create(:country) }

    it "assigns @country" do
      put :update, id: country.id
      expect(assigns(:country)).to eq(country)
    end

    it "loads map script" do
      expect(controller).to receive(:load_map_javascript)
      put :update, id: country.id
    end

    context "when valid" do
      before do
        allow_any_instance_of(Country).to receive(:valid?).and_return(true)
      end

      it "redirects to countries index" do
        put :update, id: country.id
        expect(response).to redirect_to(admin_countries_path)
      end
    end

    context "when invalid" do
      before do
        allow_any_instance_of(Country).to receive(:valid?).and_return(false)
      end

      it "renders edit view" do
        put :update, id: country.id
        expect(response).to render_template(:edit)
      end
    end
  end
end
