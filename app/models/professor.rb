class Professor < ApplicationRecord
  # validations
  validates :name, presence: true

  #relationships
  has_many :prof_course_mappings, dependent: :destroy
  has_many :courses, through: :prof_course_mappings

  has_many :time_tables, dependent: :destroy
end
