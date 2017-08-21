require 'rails_helper'

RSpec.describe Teacher::CoursesController, type: :controller do
  describe "courses#new action" do
    it "should successfully show the new form" do
      user = FactoryGirl.create(:user)
      sign_in user
      
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "courses#create action" do
    it "should successfully create a new course in the database" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, params: { course: { title: 'Cognitive Neuroscience',
                                        description: 'Course on the biological processes and aspects that underlie cognition' } }
      course = Course.last
      expect(response).to redirect_to teacher_course_path(course)

      
      expect(course.title).to eq('Cognitive Neuroscience')
      expect(course.user).to eq(user)
    end
  end
  
end
