class Requirement < ApplicationRecord
  #relationships
  belongs_to :batch
  belongs_to :course
  has_many :time_tables, dependent: :destroy

  #callbacks
  before_save :is_req_feasible
  after_save :add_req_id

  def add_req_id
    req_id = self.id
    TimeTable.where(batch_id: self.batch_id, course_id: self.course_id).update_all(requirement_id: req_id)
  end

  def createTimeTable(rec_arr)
    rec_arr.each {|rec| TimeTable.create(rec)}
  end

  def is_req_feasible
    batch_max_hours = 6
    prof_max_hours = 4
    college_start_hour = 9
    college_end_hour = 15
    course = self.course
    batch = self.batch
    professors = course.professors
    hours_req = self.no_of_class
    arr=[]
    prof_day_alloted_time_arr = []
    (1..5).each do |day|
      time_table = TimeTable.where(batch_id: batch.id, day_of_week: day)
      total_hours = 0
      time_table.inject(0) {|total_hours, rec| total_hours+=rec.end_hour - rec.start_hour}
      rem_hours_day_for_alloc =  batch_max_hours - total_hours
      rem_hours_day_for_alloc = [rem_hours_day_for_alloc, hours_req].min
      hours_rem_for_day = rem_hours_day_for_alloc

      if rem_hours_day_for_alloc > 0
        professors.each do |prof|
          break if rem_hours_day_for_alloc <= 0
          prof_time_table = TimeTable.where(day_of_week: day, professor_id: prof.id)
          prof_working_hours = 0
          time_table.inject(0) {|prof_working_hours, rec| prof_working_hours+=rec.end_hour - rec.start_hour}
          prof_hours = prof_max_hours - prof_working_hours
          if prof_hours > 0
            hours_for_prof_used = [rem_hours_day_for_alloc, prof_hours].min
            rem_hours_day_for_alloc = rem_hours_day_for_alloc - hours_for_prof_used
            (college_start_hour..college_end_hour).each do |st_hr|
              end_hr = st_hr + 1
              prof_for_hr = prof_time_table.where(start_hour: st_hr, end_hour: end_hr).last
              if prof_for_hr.nil?
                prof_hsh = {batch_id: batch.id, professor_id: prof.id, course_id: course.id, day_of_week: day, start_hour: st_hr, end_hour: end_hr}
                prof_day_alloted_time_arr.push(prof_hsh)
                prof_hours = prof_hours - 1
              end
              break if prof_hours <= 0
            end
          end
        end
      end
      hours_req = hours_req - hours_rem_for_day + rem_hours_day_for_alloc
    end
    if hours_req > 0
      self.errors.add(:base, "Not feasible requirement")
    else
       createTimeTable(prof_day_alloted_time_arr)
    end
  end
end
