require "rails_helper"

RSpec.describe ContributionsController, :type => :controller do

  describe 'GET select_or_suggest_country' do
    it 'returns 200' do
      get :select_country
      expect(response).to be_success
    end
  end

  describe 'GET select_or_suggest_city' do
    it 'returns 200' do
      get :select_city
      expect(response).to be_success
    end
  end

  describe 'GET suggest_location' do
    it 'returns 200' do
      get :suggest_location
      expect(response).to be_success
    end
  end

end
