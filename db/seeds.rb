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

users = User.create([
	{email: "test@example.com", password: "my password", password_confirmation: "my password",
		first_name: "Alejandro", last_name: "Smith"},
	{email: "23@hotmail.ca", password: "password", password_confirmation: "password",
		first_name: "Eva", last_name: "Bernal"},
	{email: "Dennis@example.com", password: "123456", password_confirmation: "123456",
		first_name: "Dennis", last_name: "Schroder"}
])

courses = Course.create([
	{course_code: "ECE568", course_name: "Computer Security", school: schools.first},
	{course_code: "ECE444", course_name: "Software Eng", school: schools.first},
	{course_code: "APS112", course_name: "ESP II", school: schools.first},
	{course_code: "GEO108", course_name: "Geographis of Everyday Life", school: schools.second}
])

users.first.courses << courses.first
users.second.courses << courses.second
users.second.courses << courses.third

course_instances = CourseInstance.create([
	{year: 2015, semester: "Winter", professor: "Mark Anthony", course: courses.fourth},
	{year: 2018, semester: "Summer", professor: "Anderson", course: courses.third},
	{year: 2012, semester: "Fall", professor: "Bill Nye", course: courses.second},
	{year: 2015, semester: "Winter", professor: "Garcia", course: courses.first},
	{year: 2016, semester: "Winter", professor: "Garcia", course: courses.first}
])

Note.create([
	{title:"my first note", body:"hello world", 
		user: users.first, course_instance: course_instances.second},
	{title:"software engineering", body:"agile>waterfall", 
		user: users.second, course_instance: course_instances.third},
	{title:"day one", body:"it's dangerous out there", 
		user: users.third, course_instance: course_instances.fourth},
	{title:"introduction", body:"be careful", 
		user: users.first, course_instance: course_instances.fifth}
])
