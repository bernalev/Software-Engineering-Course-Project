# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

schools = School.create([
	{school_name: "University of Toronto", city: "Toronto"},
	{school_name: "Ryerson", city: "Toronto"}
])

students = Student.create([
	{first_name: "Alejandro", last_name: "Smith"},
	{first_name: "Juan", last_name: "George"},
	{first_name: "Maria", last_name: "Anne"}
])

courses = Course.create([
	{course_code: "ECE568", course_name: "Computer Security", school: schools.first},
	{course_code: "ECE444", course_name: "Software Eng", school: schools.first},
	{course_code: "APS112", course_name: "ESP II", school: schools.first},
	{course_code: "GEO108", course_name: "Geographis of Everyday Life", school: schools.second}
])

Note.create(title:"my first note", body:"hello world", 
		student: students.first, course: courses.second)


Note.create(title:"software engineering", body:"agile>waterfall", 
		student: students.second, course: courses.first)
