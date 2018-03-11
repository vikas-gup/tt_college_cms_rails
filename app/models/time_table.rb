class TimeTable < ApplicationRecord
  #relationships
  belongs_to :batch
  belongs_to :professor
  belongs_to :course
  belongs_to :requirement, required: false
end
