class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
    enrolled_courses = enrollments.collect(&:course)
    return enrolled_courses.include?(course)
  end

  def current_gpa
    enrolled_course_grades = enrollments.collect(&:grade)
    if enrolled_course_grades.length == 0
      return 0
    else
      average = enrolled_course_grades.inject(0, :+) / enrolled_course_grades.length
      return average
    end
  end
end
