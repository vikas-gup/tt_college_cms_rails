class CreateCourse < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :code, presence: true, unique: true
    end
  end
end
