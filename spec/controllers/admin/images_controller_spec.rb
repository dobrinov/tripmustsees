require 'rails_helper'

RSpec.describe Admin::ImagesController, :type => :controller do

  describe "POST create" do
    let(:file_for_upload) { fixture_file_upload('/images/dummy.jpg', 'image/jpeg') }

    context "when Country image" do
      let(:imageable) { create(:country) }

      it "assigns @image" do
        post :create, country_id: imageable.id, image: { file: file_for_upload }
        expect(assigns(:image)).to be_a(Image)
      end

      it "creates new Image" do
        expect do
          post :create, country_id: imageable.id, image: { file: file_for_upload }
        end.to change(Image, :count).by(1)
      end

      it "has association from the correct type" do
        post :create, country_id: imageable.id, image: { file: file_for_upload }
        expect(assigns(:image).imageable).to eq(imageable)
      end

      it "is redirects" do
        post :create, country_id: imageable.id, image: { file: file_for_upload }
        expect(response).to be_redirect
      end
    end

    context "when City image" do
      let(:country) { create(:country) }
      let(:imageable) { create(:city) }

      it "assigns @image" do
        post :create, country_id: country.id, city_id: imageable.id, image: { file: file_for_upload }
        expect(assigns(:image)).to be_a(Image)
      end

      it "creates new Image" do
        expect do
          post :create, country_id: country.id, city_id: imageable.id, image: { file: file_for_upload }
        end.to change(Image, :count).by(1)
      end

      it "has association from the correct type" do
        post :create, country_id: country.id, city_id: imageable.id, image: { file: file_for_upload }
        expect(assigns(:image).imageable).to eq(imageable)
      end

      it "is redirects" do
        post :create, country_id: country.id, city_id: imageable.id, image: { file: file_for_upload }
        expect(response).to be_redirect
      end
    end

    context "when SightSeeing image" do
      let(:country) { create(:country) }
      let(:city) { create(:city) }
      let(:imageable) { create(:sight_seeing) }

      it "assigns @image" do
        post :create, country_id: country.id, city_id: city.id, sight_seeing_id: imageable.id, image: { file: file_for_upload }
        expect(assigns(:image)).to be_a(Image)
      end

      it "creates new Image" do
        expect do
          post :create, country_id: country.id, city_id: city.id, sight_seeing_id: imageable.id, image: { file: file_for_upload }
        end.to change(Image, :count).by(1)
      end

      it "has association from the correct type" do
        post :create, country_id: country.id, city_id: city.id, sight_seeing_id: imageable.id, image: { file: file_for_upload }
        expect(assigns(:image).imageable).to eq(imageable)
      end

      it "is redirects" do
        post :create, country_id: country.id, city_id: city.id, sight_seeing_id: imageable.id, image: { file: file_for_upload }
        expect(response).to be_redirect
      end
    end
  end

  describe "DELETE destroy" do
    let!(:image) { create(:image) }

    it "assigns @image" do
      delete :destroy, id: image.id
      expect(assigns(:image)).to eq(image)
    end

    it "is redirects" do
      delete :destroy, id: image.id
      expect(response).to be_redirect
    end

    it "destroys the Image" do
      expect do
        delete :destroy, id: image.id
      end.to change(Image, :count).by(-1)
    end
  end

end
