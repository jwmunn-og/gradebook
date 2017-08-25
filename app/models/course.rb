class Course < ApplicationRecord
  belongs_to :user
  has_many :enrollments

  validates :title, presence: true
  validates :description, presence: true

  def class_gpa
    enrolled_course_grades = self.enrollments.collect(&:grade)
    if enrolled_course_grades.length == 0
      return 0
    else
      average = enrolled_course_grades.inject(0, :+) / enrolled_course_grades.length
      return average
    end
  end
end
