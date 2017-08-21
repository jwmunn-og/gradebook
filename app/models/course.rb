class Course < ApplicationRecord
  belongs_to :user
  has_many :enrollments

  validates :title, presence: true
  validates :description, presence: true
end
