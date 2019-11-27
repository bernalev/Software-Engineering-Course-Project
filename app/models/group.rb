class Group < ApplicationRecord
	has_many :users
	belongs_to :course_instance
end
