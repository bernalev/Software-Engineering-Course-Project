class Course < ApplicationRecord
	has_many :notes
	belongs_to :school
end
