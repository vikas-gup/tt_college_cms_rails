class Batch < ApplicationRecord
	# validations
  validates :code, presence: true, uniqueness: true

  #relationships
	has_many :requirements, dependent: :destroy
  has_many :courses, through: :requirements
	has_many :professors, dependent: :destroy
  has_many :time_tables, dependent: :destroy
end
