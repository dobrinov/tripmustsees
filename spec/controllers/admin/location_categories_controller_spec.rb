require 'rails_helper'

RSpec.describe Admin::LocationCategoriesController, :type => :controller do

  before { allow(controller).to receive(:current_user).and_return(create(:admin_user)) }

  describe "GET index" do
    let(:location_category) { create(:location_category) }

    it "is 200" do
      get :index
      expect(response).to be_success
    end

    it "assigns @location_categories" do
      get :index
      expect(assigns(:location_categories)).not_to be_nil
    end
  end

  describe "GET show" do
    let!(:location_category) { create(:location_category) }

    it "is 200" do
      get :show, { id: location_category.id }
      expect(response).to be_success
    end

    it "assigns @location_category" do
      get :show, { id: location_category.id }
      expect(assigns(:location_category)).not_to be_nil
    end
  end

  describe "GET new" do
    it "is 200" do
      get :new
      expect(response).to be_success
    end

    it "assigns @location_category" do
      get :new
      expect(assigns(:location_category)).not_to be_nil
    end
  end

  describe "POST create" do
    let(:location_category) { build(:location_category) }

    it "is redirect" do
      post :create, { location_category: location_category.attributes }
      expect(response).to redirect_to(admin_location_categories_path)
    end

    it "assigns @location_category" do
      post :create, { location_category: location_category.attributes }
      expect(assigns(:location_category)).not_to be_nil
    end

    it "creates a new LocationCategory" do
      expect do
        post :create, { location_category: location_category.attributes }
      end.to change(LocationCategory, :count).by(1)
    end
  end

  describe "GET edit" do
    let!(:location_category) { create(:location_category) }

    it "is 200" do
      get :edit, { id: location_category.id }
      expect(response).to be_success
    end

    it "assigns @location_category" do
      get :edit, { id: location_category.id }
      expect(assigns(:location_category)).not_to be_nil
    end
  end

  describe "PUT update" do
    let!(:location_category) { create(:location_category) }

    it "is redirect" do
      put :update, { id: location_category.id }
      expect(response).to redirect_to(admin_location_categories_path)
    end

    it "assigns @location_category" do
      put :update, { id: location_category.id }
      expect(assigns(:location_category)).not_to be_nil
    end
  end

  describe "DELETE destroy" do
    let!(:location_category) { create(:location_category) }

    it "is redirect" do
      delete :destroy, { id: location_category.id }
      expect(response).to redirect_to(admin_location_categories_path)
    end

    it "assigns @location_category" do
      delete :destroy, { id: location_category.id }
      expect(assigns(:location_category)).not_to be_nil
    end

    it "deletes a LocationCategory" do
      expect do
        delete :destroy, { id: location_category.id }
      end.to change(LocationCategory, :count).by(-1)
    end
  end

end
