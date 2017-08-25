class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.enrollments.create(course: current_course)
    redirect_to root_path
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    @enrollment.update_attributes(enrollment_params)
    redirect_to teacher_course_path(@enrollment.course_id)
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    redirect_to teacher_course_path(@enrollment.course_id)
  end

  private

  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:grade)
  end
end
