class Note < ApplicationRecord
	belongs_to :student
	belongs_to :course_instance
end
