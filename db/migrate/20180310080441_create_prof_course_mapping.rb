class CreateProfCourseMapping < ActiveRecord::Migration[5.0]
  def change
    create_table :prof_course_mappings do |t|
      t.belongs_to :professor
      t.belongs_to :course
    end
  end
end
