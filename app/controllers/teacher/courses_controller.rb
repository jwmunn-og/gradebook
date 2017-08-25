class Teacher::CoursesController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.create(course_params)
    if @course.valid?
      redirect_to teacher_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
    @students = Enrollment.where(course_id: @course.id)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
