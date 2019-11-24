class Course < ApplicationRecord
	has_many :course_instances
	belongs_to :school
	has_and_belongs_to_many :users

	DEPTS = [
		"Computer Engineering",
		"Electrical Engineering",
		"Mechanical Engineering",
		"Computer Science",
		"Arts and Science",
		"Economics"
	]
	validates :department, inclusion: {in: DEPTS}
end
