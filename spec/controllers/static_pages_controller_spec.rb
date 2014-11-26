require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do

  describe 'GET landingpage' do

    it "is successful" do
      get :landingpage
      expect(response).to be_success
    end

  end

  describe 'GET about' do

    it "is successful" do
      get :about
      expect(response).to be_success
    end

  end  

end
