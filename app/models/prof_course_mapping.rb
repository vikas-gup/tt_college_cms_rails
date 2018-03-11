class ProfCourseMapping < ApplicationRecord
  #validations
  validates :professor_id, uniqueness: {scope: [:course_id]}

  #relationships
  belongs_to :professor
  belongs_to :course
end
