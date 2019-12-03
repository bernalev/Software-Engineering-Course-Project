class Note < ApplicationRecord
	belongs_to :user
	belongs_to :course_instance
	has_many :ratings
	has_one_attached :file
	include PublicActivity::Model
	tracked

	def ave_rating
		size = 0
		sum = 0
		self.ratings.each do |rating|
			size = size + 1
			sum = sum + rating.score
		end
		if (size ==0)
			return '-'
		end 

		return (sum /size).round(1)

	end

end
