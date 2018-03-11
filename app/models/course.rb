class Course < ApplicationRecord
  # validations
  #validates :code, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true , format: { with: /[a-zA-Z]+-[0-9]+/i }
  #relationships
  has_many :requirements, dependent: :destroy
  has_many :batches, through: :requirements

  has_many :prof_course_mappings, dependent: :destroy
  has_many :professors, through: :prof_course_mappings

  has_many :time_tables, dependent: :destroy
end
