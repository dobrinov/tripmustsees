require "rails_helper"

RSpec.describe SitemapsController, :type => :controller do

  describe "index" do
    context "when format is XML" do
      let(:format) { :xml }

      it "assigns @static_paths" do
        get :index, { format: format }
        expect(assigns(:static_paths)).not_to be_nil
      end

      it "assigns @countries" do
        get :index, { format: format }
        expect(assigns(:countries)).not_to be_nil
      end

      it "assigns @cities" do
        get :index, { format: format }
        expect(assigns(:cities)).not_to be_nil
      end

      it "assigns @locations" do
        get :index, { format: format }
        expect(assigns(:locations)).not_to be_nil
      end

      it "should be 200" do
        get :index, { format: format }
        expect(response).to be_success
      end
    end
  end

end
