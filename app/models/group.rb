class Group < ApplicationRecord
	has_many :student_groups
	has_many :users, through: :student_groups
	belongs_to :course_instance
end
