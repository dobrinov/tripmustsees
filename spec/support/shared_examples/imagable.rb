require 'rails_helper'

RSpec.shared_examples "imagable" do
  let(:model) { described_class }
  let(:model_instance) { create(model.name.downcase.to_sym) }

  describe "#primary_image" do
    context "when images are available" do
      before do
        5.times { |i| model_instance.images << build(:image, created_at: Time.now + i.days) }
      end

      it "is an Image" do
        expect(model_instance.primary_image).to be_a(Image)
      end

      context "when images have priority" do

        let(:most_important_image) { model_instance.images.order(priority: :asc).first }

        before do
          model_instance.images.offset(3).first.update(priority: 999)
        end

        it "returns the one with the greather priority" do
          expect(model_instance.primary_image).to eq(most_important_image)
        end
      end

      context "when priority is the same" do
        let(:oldest_image) { model_instance.images.order(created_at: :asc).first }

        before do
          model_instance.images.update_all(priority: nil)
        end

        it "returns the first created" do
          expect(model_instance.primary_image).to eq(oldest_image)
        end
      end
    end

    context "when images are not available" do
      it "is a new Image" do
        expect(model_instance.primary_image).to be_a_new(Image)
      end
    end
  end


  describe "#secondary_images" do
    it "is an ActiveRecord::AssociationRelation" do
      expect(model_instance.secondary_images).to be_a(ActiveRecord::AssociationRelation)
    end

    context "when images are available" do
      before do
        5.times { |i| model_instance.images << build(:image, created_at: Time.now + i.days) }
      end

      it "does not include the main image" do
        expect(model_instance.secondary_images).not_to include(model_instance.primary_image)
      end

      it "has size with one less than all images" do
        expect(model_instance.secondary_images.count).to eq(model_instance.images.count - 1)
      end
    end

    context "when images are not available" do
    end
  end
end
