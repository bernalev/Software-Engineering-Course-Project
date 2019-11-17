class Course < ApplicationRecord
	has_many :course_instances
	belongs_to :school
	has_and_belongs_to_many :users
end
