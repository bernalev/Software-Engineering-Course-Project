# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

num_schools = 20
num_users = 30
num_courses = 60
num_notes = 200
num_course_instances = 120
num_groups = 15
num_tutor_ads = 15
num_messages = 40 


schools_array = Array.new(num_schools)
for i in 0..schools_array.length
	schools_array[i] = {school_name: Faker::Educator.university, city: Faker::Educator.campus}
end
schools = School.create(schools_array)

# TODO name should match email, how do
users_array = Array.new(num_users)
for i in 0..users_array.length
	#f_name = Faker::Name.first_name 
	#l_name = Faker::Name.last_name
	#pass = Faker::Alphanumeric.alphanumeric(number: 8, min_alpha: 3, min_numeric: 3)
	users_array[i] = {email: Faker::Internet.email(name: Faker::Name.name, separators: %w(+ . _ -)), 
		password: "my password", password_confirmation: "my password",
		first_name: Faker::Name.first_name, last_name: Faker::Name.last_name}
end
users = User.create(users_array)


# course_code not a given attribute of Faker::Educator
# maybe get from actual uni site ?
courses_array = Array.new(num_courses)
for i in 0..courses_array.length
	courses_array[i] = {
		course_code: "#{Faker::Alphanumeric.alpha(number: 3)}#{Faker::Number.number(digits: 3)}".upcase, 
		course_name: Faker::Educator.course_name, 
		school: schools[Faker::Number.between(from: 0, to: num_schools-1)], 
		department: Faker::Educator.subject
	}
end
courses = Course.create(courses_array)

users.first.courses << courses.first
users.second.courses << courses.second
users.second.courses << courses.third

seasons = ["Winter", "Fall", "Spring", "Summer", "Autumn", "Year"]
course_instances_array = Array.new(num_course_instances)
for i in 0..course_instances_array.length
	course_instances_array[i] = {
		year: Faker::Number.between(from: 2010, to: 2019), 
		semester: seasons[Faker::Number.between(from: 0, to: seasons.length-1)], 
		professor: Faker::Name.name, 
		course: courses[Faker::Number.between(from: 0, to: num_courses-1)]
	}
end
course_instances = CourseInstance.create(course_instances_array)

groups_array = Array.new(num_groups)
for i in 0..groups_array.length
	groups_array[i] = {
		name: "#{Faker::Name.name} Group",
		course: courses[Faker::Number.between(from: 0, to: num_courses-1)]
	}
end
groups = Group.create(groups_array)

# give groups users
# give groups messages by those users
messages_array = Array.new(num_messages)
for i in 0..messages_array.length
	j = i
	if j > (num_users-1)
		j = j % num_users
	end
	k = i
	if k > (num_groups-1)
		k = k % num_groups
	end
	messages_array[i] = {
		title: Faker::Lorem.words(number: 2).join(" "),
		text: Faker::Lorem.paragraph,
		user: users[j],
		group: groups[k]
	}
	groups[k].users << users[j]
end
messages = Message.create(messages_array)

notes_array = Array.new(num_notes)
for i in 0..notes_array.length
	notes_array[i] = 	{
		title: Faker::Book.title, body: Faker::Lorem.paragraphs.join(". "), 
		user: users[Faker::Number.between(from: 0, to: num_users-1)], 
		course_instance: course_instances[Faker::Number.between(from: 0, to: num_course_instances-1)]
	}
end
notes = Note.create(notes_array)


tutor_ads_array = Array.new(num_tutor_ads)
for i in 0..tutor_ads_array.length
	tutor_ads_array[i] = 	{
		title: "#{Faker::Educator.subject} Tutor", 
		ad_type: Faker::Number.between(from: 0, to: 1), 
		description: "As a #{Faker::Job.title}, I have great #{Faker::Job.key_skill}. #{Faker::Quote.matz}", 
		hour_rate: Faker::Number.between(from: 0, to: 50),
		user: users[Faker::Number.between(from: 0, to: num_users-1)]
	}
end
tutor_ads = TutorAd.create(tutor_ads_array)
      