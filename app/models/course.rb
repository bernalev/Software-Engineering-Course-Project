class Course < ApplicationRecord
	has_many :course_instances
	belongs_to :school
end
