require "rails_helper"

RSpec.describe SessionsController, :type => :controller do

  describe "POST create" do
    let(:user) { create(:user) }
    before { expect(User).to receive(:from_omniauth).and_return(user) }

    it 'redirects to root_path' do
      post :create
      expect(response).to redirect_to root_path
    end

    it 'sets user[id] session' do
      expect {
        post :create
      }.to change { session[:user_id] }.to(user.id)
    end
  end

  describe "DELETE destroy" do
    before { session[:user_id] = 123 }

    it 'redirects to root_path' do
      delete :destroy
      expect(response).to redirect_to root_path
    end

    it 'unsets user[id] session' do
      expect {
        delete :destroy
      }.to change { session[:user_id] }.to(nil)
    end
  end
end
