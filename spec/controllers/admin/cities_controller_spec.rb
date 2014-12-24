require 'rails_helper'

RSpec.describe Admin::CitiesController, :type => :controller do

  let(:country) { create(:country) }

  let(:invalid_attributes) do
    city.attributes.merge(latitude: nil)
  end


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


  describe 'GET show' do
    let!(:city) { create(:city) }

    it "assigns @country" do
      get :show, { country_id: country.id, id: city.id }
      expect(assigns(:country)).to eq(country)
    end

    it "assigns @city" do
      get :show, { country_id: country.id, id: city.id }
      expect(assigns(:city)).to eq(city)
    end

    it "is successful" do
      get :show, { country_id: country.id, id: city.id }
      expect(response).to be_success
    end
  end


  describe 'GET new' do
    let(:city) { build(:city) }

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
    let(:city) { build(:city) }

    it "assigns @country" do
      post :create, { country_id: country.id, city: city.attributes }
      expect(assigns(:country)).to eq(country)
    end

    it "assigns @city" do
      post :create, { country_id: country.id, city: city.attributes }
      expect(assigns(:city)).to be_instance_of(City)
    end

    context "when valid" do
      it "creates a new City" do
        expect { post :create, { country_id: country.id, city: city.attributes } }.to change(City, :count).by(1)
      end

      it "is redirect" do
        post :create, { country_id: country.id, city: city.attributes }
        expect(response).to redirect_to admin_country_cities_path(country)
      end
    end


    describe 'GET edit' do
      let!(:city) { create(:city) }

      it "assigns @country" do
        get :edit, { country_id: country.id, id: city.id }
        expect(assigns(:country)).to eq(country)
      end

      it "assigns @city" do
        get :edit, { country_id: country.id, id: city.id }
        expect(assigns(:city)).to eq(city)
      end

      it "is successful" do
        get :edit, { country_id: country.id, id: city.id }
        expect(response).to be_success
      end
    end


    describe 'PUT update' do
      let!(:city) { create(:city) }

      it "assigns @country" do
        put :update, { country_id: country.id, id: city.id }
        expect(assigns(:country)).to eq(country)
      end

      it "assigns @city" do
        put :update, { country_id: country.id, id: city.id }
        expect(assigns(:city)).to eq(city)
      end

      context "when valid" do
        before do
          allow_any_instance_of(City).to receive(:valid?).and_return(true)
        end

        it "redirects to cities index" do
          put :update, { country_id: country.id, id: city.id }
          expect(response).to redirect_to(admin_country_cities_path(country))
        end
      end

      context "when invalid" do
        before do
          allow_any_instance_of(City).to receive(:valid?).and_return(false)
        end

        it "renders edit" do
          put :update, { country_id: country.id, id: city.id }
          expect(response).to render_template(:edit)
        end
      end
    end


    context "when invalid" do
      it "is successful" do
        post :create, { country_id: country.id, city: invalid_attributes }
        expect(response).to be_success
      end
    end
  end
end
