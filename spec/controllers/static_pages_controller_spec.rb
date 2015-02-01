require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do

  describe 'GET landingpage' do
    it "is successful" do
      get :landingpage
      expect(response).to be_success
    end

    it "assigns @countries" do
      get :landingpage
      expect(assigns(:countries)).not_to be_nil
    end

    it "tracks page view" do
      expect(controller).to receive(:mixpanel_track_landing_page_view)
      get :landingpage
    end
  end


  describe 'GET about' do
    it "is successful" do
      get :about
      expect(response).to be_success
    end

    it "tracks page view" do
      expect(controller).to receive(:mixpanel_track_about_page_view)
      get :about
    end
  end

end
