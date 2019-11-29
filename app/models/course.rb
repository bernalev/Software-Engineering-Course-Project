class Course < ApplicationRecord
	has_many :course_instances
	belongs_to :school
	has_and_belongs_to_many :users

	DEPTS =  ['Arts', 'Business', 'Education', 'Applied Science (Psychology)', 'Architectural Technology', 
		'Biological Science', 'Biomedical Science', 'Commerce', 'Communications', 'Creative Arts', 
		'Criminology', 'Design', 'Engineering', 'Forensic Science', 'Health Science', 'Information Systems', 
		'Computer Science', 'Law', 'Nursing', 'Medicine', 'Psychology', 'Teaching']
	validates :department, inclusion: {in: DEPTS}

	def self.DEPTS
		DEPTS
	end
end
