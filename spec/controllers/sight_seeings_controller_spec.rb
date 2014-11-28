require "rails_helper"

RSpec.describe SightSeeingsController, :type => :controller do

  describe 'GET show' do
    it "assigns @sight_seeing" do
      sight_seeing = create(:sight_seeing)
      get :show, { id: sight_seeing.to_param }
      expect(assigns(:sight_seeing)).to eq(sight_seeing)
    end
  end

end
