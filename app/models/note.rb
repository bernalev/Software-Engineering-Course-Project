class Note < ApplicationRecord
	belongs_to :user
	belongs_to :course_instance
	has_one_attached :file
	include PublicActivity::Model
	tracked
end
