class CreateTimeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :time_tables do |t|
      t.belongs_to :requirement
      t.belongs_to :batch
      t.belongs_to :professor
      t.belongs_to :course
      t.integer :day_of_week
      t.integer :start_hour
      t.integer :end_hour
    end
  end
end
