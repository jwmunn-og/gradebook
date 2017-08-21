require 'rails_helper'

RSpec.describe Teacher::CoursesController, type: :controller do
  describe "courses#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "courses#create action" do
  #   it "should successfully create a new course in the database" do
  #     post :create, params: { course: { title: 'Cognitive Neuroscience' } }
  #   end
  # end
  
end
