require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe "dashboards#show action" do
    it "should successfully show the page" do
      user = FactoryGirl.create(:user)
      sign_in user
      
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
