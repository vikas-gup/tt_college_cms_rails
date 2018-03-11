# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

batch1 = Batch.where(code: 1401).first_or_create
batch1.description = "Batch 2014, computer science (01)"
batch1.save!

batch2 = Batch.where(code: 2401).first_or_create
batch2.description = "Batch 2014, computer science (02)"
batch2.save!

batch3 = Batch.where(code: 3401).first_or_create
batch3.description = "Batch 2014, computer science (03)"
batch3.save!

course1 = Course.where(code: "CS-101").first_or_create
course2 = Course.where(code: "CS-401").first_or_create
course3 = Course.where(code: "BT-412").first_or_create

prof1 = Professor.where(name: "RPS").first_or_create
prof2 = Professor.where(name: "KGS").first_or_create
prof3 = Professor.where(name: "LOP").first_or_create

prof_cours_1 = ProfCourseMapping.where(professor_id: prof1.id, course_id: course1.id).first_or_create
prof_cours_2 = ProfCourseMapping.where(professor_id: prof2.id, course_id: course2.id).first_or_create
prof_cours_3 = ProfCourseMapping.where(professor_id: prof3.id, course_id: course3.id).first_or_create


req1 = Requirement.where(batch_id: batch1.id, course_id: course1.id, no_of_class: 8).first_or_create
req2 = Requirement.where(batch_id: batch2.id, course_id: course2.id, no_of_class: 4).first_or_create
req3 = Requirement.where(batch_id: batch3.id, course_id: course3.id, no_of_class: 6).first_or_create
