# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = Student.create([
	{first_name: "Alejandro", last_name: "Smith"},
	{first_name: "Juan", last_name: "George"},
	{first_name: "Maria", last_name: "Anne"}
])

Note.create(title:"my first note", body:"hello world", 
		student: students.first)


Note.create(title:"software engineering", body:"agile>waterfall", 
		student: students.second)
