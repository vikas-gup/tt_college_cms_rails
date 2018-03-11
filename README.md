---------------Documentation-----------

http://localhost:3000/apipie

----------Setup------------
rake db:create
rake db:migrate
rake db:seed


--------------Curl Request    -------

-------Batches--------------

Index -
curl -X GET http://localhost:3000/batches

Show
curl -X GET http://localhost:3000/batches/1

Create
curl -X POST http://localhost:3000/batches -F code=1901  -F 'description=Batch 2014, electronics  (01)'


Update
curl -X PUT http://localhost:3000/batches/1  -F code=1111 -F 'description=Batch 2014, electronics  (01)'

curl -X DELETE http://localhost:3000/batches/1


-----------------Courses----------------

Index -
curl -X GET http://localhost:3000/courses

Show
curl -X GET http://localhost:3000/courses/1

Create
curl -X POST http://localhost:3000/courses  -F code=CS-401

Update
curl -X PUT http://localhost:3000/courses/1  -F code=CS-401

curl -X DELETE http://localhost:3000/courses/1


---------------------Professors----------------

Index -
curl -X GET http://localhost:3000/professors

Show
curl -X GET http://localhost:3000/professors/1

Create
curl -X POST http://localhost:3000/professors -F name=Test

Update
curl -X PUT http://localhost:3000/professors/1 -F name=Test

Delete
curl -X DELETE http://localhost:3000/professors/1


---------------ProfessorCourseMapping---------------

Index -
curl -X GET http://localhost:3000/prof_course_mappings

Show
curl -X GET http://localhost:3000/prof_course_mappings/1

Create
curl -X POST http://localhost:3000/prof_course_mappings  -F professor_id=1 -F course_id=1

Update
curl -X PUT http://localhost:3000/prof_course_mappings/1  -F professor_id=1 -F course_id=2

Delete
curl -X DELETE http://localhost:3000/prof_course_mappings/1

---------------Requirement-----------------


Index -
curl -X GET http://localhost:3000/requirements

Show
curl -X GET http://localhost:3000/requirements/1

Create
curl -X POST http://localhost:3000/requirements  -F batch_id=1 -F course_id=1 -F no_of_class=8

Update
curl -X POST http://localhost:3000/requirements/1  -F batch_id=1 -F course_id=1 -F no_of_class=9


-------------------TimeTable-----------------

Index -
curl -X GET http://localhost:3000/time_tables

curl -X GET http://localhost:3000/time_tables -F batch_id=1

curl -X GET http://localhost:3000/time_tables -F course_id=1

curl -X GET http://localhost:3000/time_tables -F professor_id=1

curl -X GET http://localhost:3000/time_tables -F day_of_week=1
