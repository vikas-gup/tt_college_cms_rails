# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180310211959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.integer "code"
    t.string  "description"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code"
  end

  create_table "prof_course_mappings", force: :cascade do |t|
    t.integer "professor_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_prof_course_mappings_on_course_id", using: :btree
    t.index ["professor_id"], name: "index_prof_course_mappings_on_professor_id", using: :btree
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
  end

  create_table "requirements", force: :cascade do |t|
    t.integer "batch_id"
    t.integer "course_id"
    t.integer "no_of_class"
    t.index ["batch_id"], name: "index_requirements_on_batch_id", using: :btree
    t.index ["course_id"], name: "index_requirements_on_course_id", using: :btree
  end

  create_table "time_tables", force: :cascade do |t|
    t.integer "requirement_id"
    t.integer "batch_id"
    t.integer "professor_id"
    t.integer "course_id"
    t.integer "day_of_week"
    t.integer "start_hour"
    t.integer "end_hour"
    t.index ["batch_id"], name: "index_time_tables_on_batch_id", using: :btree
    t.index ["course_id"], name: "index_time_tables_on_course_id", using: :btree
    t.index ["professor_id"], name: "index_time_tables_on_professor_id", using: :btree
    t.index ["requirement_id"], name: "index_time_tables_on_requirement_id", using: :btree
  end

end
