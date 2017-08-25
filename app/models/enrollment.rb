class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  delegate :email, to: :user
end
